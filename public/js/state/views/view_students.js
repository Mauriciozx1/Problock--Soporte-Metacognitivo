CSLP.State.Views.ViewStudents = Backbone.View.extend({

    events : {
        'click #btn-run' : 'runCode',
        'change input.cb-rule[type=checkbox]' : 'changeRule',
        'click #btn-add-result-value' : 'addExpectedResult',
        'click .btn-remove-result-value' : 'removeExpectedResult',
        'click .select-chat' : 'selectStudent'
    },

    currentActivity : undefined,

    teamWorks : [],

    teamStudents : [],

    status : [],

    students : [],

    arrayPrev :[],

    isView : false,

    chats : undefined,

    initialize : function() {
        this.teamWorks = window.infoTeamwork;
        this.students = window.students;
        //console.log(window.statusView.currentActivity);
    },

    //Cambia la actividad con la cual se está trabajando
    setActivity : function(activity) {
        this.currentActivity = activity;
        window.objectivesSection.setActivity(activity);
        if(!this.isView){
            this.render();
            this.isView = true;
        }
        
        if(this.arrayPrev){
            this.updatePrev();    
        }
        this.renderInfo();
        console.log(window.infoTeamwork);
    },
    selectStudent : function(event){
        var tab = $(event.currentTarget);
        console.log(tab);
        var id = tab.attr('id').split('-');
        $('#title-chat').html('<strong>Mensajes con:</strong><p>'+tab.attr('name')+'</p>');
        window.chatView.setChat(tab.attr('name'), id[1]);
        console.log(window.chatView.chats);
    },
    renderInfo : function(){
        var txtLista = "<hr><ul>";
        var rules = this.currentActivity.get("rules");
        for(var rule in rules) {

            var isCritic = (rules[rule].condition === 1) ? '*' : '';

            if(rule == "correct_result" && rules[rule].values != null) {
                txtLista += "<li>" + rulesToText[rule] + ": " + rules[rule].values.join(',') + " (" + rules[rule].points + " pts)" + isCritic + "</li>"
            } else {
                txtLista += "<li>" + rulesToText[rule] + " (" + rules[rule].points + " pts)" + isCritic + "</li>"

            }
        }
        txtLista += "</ul>";

        //Render panel de recursos
        this.$('#resources-panel').html('<h1 style="text-align:center;"><b>Información de la Actividad</b></h1>'+this.currentActivity.get('resource') + txtLista);
    
    },
    

    render : function(){
        if(this.currentActivity){
            if(this.currentActivity.get('problem_type') == 'Grupal'){
                this.renderTeam();
            }else{
                this.students.forEach(element => {
                    $('<div>',{
                        id: element.id,
                        class : 'list-student-status',
                        style : 'text-align:center; margin:1rem;',
                        name : element.name+' '+ element.flastname
                    }).append(
                        $('<span>',{
                            id : 'name-'+element.id,
                            class : 'select-chat',
                            text : element.name+' '+ element.flastname,
                            name : element.name+' '+ element.flastname
                            
                        })
                    ).append(
                        $('<span>',{
                            id : 'icons-'+element.id,
                            class : 'material-icons',
                            style : 'color:'+element.color+'; margin:0.5rem;',
                            text : element.status,
                        })
                    ).hide().appendTo('#list-activity').fadeIn('slow');
                });
                //Renderizar lista de estudiantes
                console.log(this.students);
            }
        }
        
    },
    renderTeam : function(){
        var newTag = null;
        var team = null;
        this.$('.title-list-activities').html("<strong>Lista de Estudiantes</strong><p>Presiona en el nombre del estudiante para poder abrir una comuncación con el.</p><p>Tambien puedes presionar en el nombre del equipo para comunicarte con todos los integrantes del Grupo.</p>");
        this.teamWorks.forEach(element => {
            team = element.id;
            newTag = this.$('#list-activity').hide().fadeIn('slow').append(
                $('<div>',{
                    id: element.id,
                    class : 'list-student-status',
                    style : 'text-align:center; margin:1rem;',
                    
                }).append(
                    $('<span>',{
                        id : 'name-'+element.id,
                        text : element.nameTeam,
                        class : 'name-team select-chat',
                        name : element.nameTeam
                        
                    })
                ));
            var students = element.students;
            students.forEach(element => {
                $('<div>',{
                    class:'content-interger',
                    style:''
                }).append(
                    $('<span>',{
                        id : 'name-'+element.id,
                        class : 'select-chat',
                        text : element.name+' '+ element.flastname,
                        name : element.name+' '+ element.flastname
                    })
                ).append(
                    $('<span>',{
                        id : 'icons-'+element.id,
                        class : 'material-icons',
                        style : 'color:'+element.color+'; margin:0.5rem;',
                        text : element.status,
                    })
                ).hide().fadeIn('slow').appendTo('#'+team);
            });
        });
    },

    updatePrev : function(){
        console.log(this.arrayPrev);
        this.arrayPrev.forEach(element => {
            if(!element.data){
                this.setStatus(element.user,{status:'check_circle',color:'green'});
            }else{
                this.setStatus(element.user, element.data);
            }
            
        });
    },

    setStatus : function(user, type){
        if(this.currentActivity){

            this.$('#icons-'+user.id).css('color', type.color);
            this.$('#icons-'+user.id).text(type.status);
                
            if(this.currentActivity.get('problem_type') == 'Grupal'){
                this.teamWorks.forEach(element => {
                
                    element.students.forEach(element => {
                        if(user.id == element.id){
                            element.status = type.status;
                            element.color =  type.color;
                        }
                    });
                });
                
            }else{
                this.students.forEach(element => {
                    if(user.id == element.id){
                        element.status = type.status;
                        element.color =  type.color;
                    }
                });
            }
        }
        
    },

    updateStatus : function(data){
        data.forEach(element => {
            this.setStatus(element.user, element.type);
        });
    }
});