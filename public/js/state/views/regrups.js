CSLP.State.Views.ReGrups = Backbone.View.extend({

    events : {
        'click #btn-close-regrup' : 'close',
        'click #btn-add-team' : 'addNewTeam',
        'click #btn-regroups' : 'applyChange',
        'click #btn-restart' : 'restart',
    },

    teamWorks : undefined,
    studentsNotTeam : [],
    prevTeam : undefined,
    pivote : 0,
    initialize : function() {
        
    },

    show : function(){
        this.teamWorks = window.teamwork.get('teamworks');
        this.$('#list-activity-regrup').html("");
        this.renderTeam();

    },
    /*
    restart : function(){
        console.log(teamworksData);
        var array = this.model.getTeams();
        window.infoTeamwork = array;
        console.log(array);

        this.teamWorks = array;
        if(this.studentsNotTeam.length > 0){
            $('#no-team-content').fadeOut(200);
            $('#no-team').html("");
        }

        this.studentsNotTeam = [];
        this.$('#list-activity-regrup').html("");
        this.renderTeam();
        
    },*/
    setTeams : function(teamworks) {
        this.teamWorks = teamworks;
        this.$('#list-activity-regrup').html("");
        this.renderTeam();
        
        
    },
    applyChange : function(){
        var go = false;
        var limit = false;
        this.teamWorks.forEach(element => {
            if(element.students.length == 0){
                go = true;
            }
            if(element.students.length > 3){
                limit = true;
            }
        });
        if(this.studentsNotTeam.length == 0 && go == false && limit == false){
            console.log(this.teamWorks);
            window.teamwork.update(this.teamWorks);
            window.teamwork.postData();
        }
        if(go == true){
            $('#team-nofull-warning').fadeIn(300);
            setTimeout(function(){
                $('#team-nofull-warning').fadeOut(300);
            },2000);
        }
        if(limit == true){
            $('#team-full-warning').fadeIn(300);
            setTimeout(function(){
                $('#team-full-warning').fadeOut(300);
            },2000);
        }
        if(this.studentsNotTeam.length > 0){
            $('#no-team-warning').fadeIn(300);
            setTimeout(function(){
                $('#no-team-warning').fadeOut(300);
            },2000);
        }
        
    },
    addNewTeam : function(){
        var num = this.teamWorks.length;
        var nameTeam = 'Nuevo Equipo: '+ (num+1);
        this.teamWorks.forEach(element => {
            if(element.nameTeam == nameTeam){
                nameTeam = 'Nuevo Equipo: '+ (num+2);
            }
        });
        
        this.teamWorks.push({
            id: 0+''+(this.pivote), 
            nameTeam: 'Nuevo Equipo: '+ (num+1),
            students : []
        });
        
        this.$('#list-activity-regrup').hide().fadeIn('slow').append(
            $('<div>',{
                id: 'team-0'+(this.pivote),
                class : 'list-student-status',
                style : 'text-align:center; margin: 1rem;',
                ondragstart: "startDragTeam(event)",
                draggable: "true",
                ondrop: "dropTeam(event)",
                ondragover: "allowDrop(event)",
                
                
            }).append(
                $('<span>',{
                    id : 'team-name-0'+(this.pivote),
                    text : nameTeam,
                    class : 'name-team select-chat',
                    name : nameTeam
                    
                })
            ).append(
                $('<div>',{
                    id : 'content-interger0'+(this.pivote),
                    class:'content-interger',
                    style:'display:grid;',
                    
                    
                })
            ));
        
        this.pivote++;
        
    },
    close : function(){
        
        this.$('.modal-regrup').fadeOut(400);
        /*
        if(this.studentsNotTeam.length > 0){
            $('#no-team-content').fadeOut(200);
            $('#no-team').html("");
        }
        this.studentsNotTeam = [];
        this.$('#list-activity-regrup').html("");
        */
    },
    allowDrop : function(event){
        event.preventDefault();

    },

    dropDelete : function(event){
        event.preventDefault();
        var data = event.dataTransfer.getData("text").split('-');
        if(data[0] == 'team'){
            $('#team-'+data[1]).remove();
            this.teamWorks.forEach(element => {
                if(element.id == data[1]){
                    element.students.forEach(element => {
                        this.studentsNotTeam.push(element);
                    });
                }
            });
            this.teamWorks = this.teamWorks.filter(element => element.id != data[1]);
            for(var i = 0, j = this.teamWorks.length; i < j; i++ ) {
                if(this.teamWorks[i] == null ) {
                    this.teamWorks.splice( i, 1 );
                    i--;
                }
            }
            this.renderNoTeam();
        }else{
            this.moveWarning();
            console.log('Movimiento Invalido.');
        }
    },
    moveWarning : function(){
        $('#move-warning').fadeIn(300);
        setTimeout(function(){
            $('#move-warning').fadeOut(300);
        },2000);
    },
    renderNoTeam : function(){
        console.log(this.studentsNotTeam);
        console.log(this.teamWorks);
        if(this.studentsNotTeam.length != 0){
            $('#no-team').html("");
            if(!$('#no-team-content').is(':visible')){
                $('#no-team-content').show(500);
            }
            this.studentsNotTeam.forEach(element => {
                $('<span>',{
                    id : 'user-'+element.id+'-noteam',
                    class : 'select-chat select-edit',
                    text : element.name+' '+ element.flastname,
                    name : element.name+' '+ element.flastname,
                    ondragstart: "startDragStudent(event)",
                    draggable: "true",
                }).hide().fadeIn('slow').appendTo('#no-team');
            });
        }
        
    },
    dropTeam : function(event){
        console.log(this.studentsNotTeam);
        
        event.preventDefault();
        var data = event.dataTransfer.getData("text");
        var arrayData = data.split('-');
        console.log(data);
        if(arrayData[0] == 'user'){
            var array = $(event.currentTarget).attr('id').split('-');
            $('#content-interger'+array[1]).append(document.getElementById(data));
            var idStudent = data.split('-');
            if(arrayData[2] == 'noteam'){
                $('#user-'+idStudent[1]+'-noteam').attr('id', 'user-'+idStudent[1]);
                this.moveInterger(idStudent[1], array[1], 'noteam');
            }else{
                this.moveInterger(idStudent[1], array[1], null);
            }
            console.log(this.teamWorks);
            /*
            var count = this.countInterger(array[1]);
            if(count < 3){
                $('#content-interger'+array[1]).append(document.getElementById(data));
                document.getElementById(data).style.color="blue";
            }else{
                console.log('Capacidad máxima de usuarios completa.');
            }
            */
        }else{
            this.moveWarning();
        }
    },
    moveInterger : function(idUser, newTeamid, type){
        console.log(type);
        var arrayTeam = this.teamWorks;
        if(type == null){
            var firstTeamid = this.searchTeam(idUser);
            var student = null;
            arrayTeam.forEach(element => {
                element.students.forEach(element => {
                    if(element.id == idUser){
                        student = element;
                        console.log(element);
                    }
                });
            });
            
            arrayTeam.forEach(element => {
                if(element.id == firstTeamid){
                    element.students = element.students.filter(element => element.id != idUser);
                    for(var i = 0, j = element.students.length; i < j; i++ ) {
                        if(element.students[i] == null ) {
                            element.students.splice( i, 1 );
                            i--;
                        }
                    }
                }
                if(element.id == newTeamid ){
                    element.students.push(student);
                }
            });
        }
        if(type == 'noteam'){
            var student = null;
            this.studentsNotTeam.forEach(element => {
                if(element.id == idUser){
                    student = element;
                }
            });
            console.log(student);
            this.studentsNotTeam = this.studentsNotTeam.filter(element => element.id != idUser);

            for(var i = 0, j = this.studentsNotTeam.length; i < j; i++ ) {
                if(this.studentsNotTeam[i] == null ) {
                    this.studentsNotTeam.splice( i, 1 );
                    i--;
                }
            }
            arrayTeam.forEach(element => {
                if(element.id == newTeamid ){
                    element.students.push(student);
                }
            });
            if($('#no-team-content').is(':visible') && this.studentsNotTeam.length == 0){
                $('#no-team-content').hide(500);
            }
        }
        this.teamWorks = arrayTeam;
    },
    searchTeam : function(idUser){
        var team = null
        this.teamWorks.forEach(element => {
            var idTeam = element.id;
            element.students.forEach(element => {
                if(element.id == idUser){
                    team = idTeam;
                }
            });
        
        });
        return team;
    },
    countInterger : function(idTeam){
        var count = 0;
        this.teamWorks.forEach(element => {
            if(element.id == idTeam){
                var students = element.students;
                students.forEach(element => {
                    count++;
                });
            }
        });
        return count;
    },
    startDragStudent : function(event){
        var idTeam = event.target.parentNode.id;
        event.dataTransfer.setData("text", event.target.id);
        console.log(idTeam);
    },
    startDragTeam : function(event){
        event.dataTransfer.setData("text", event.target.id);
    },

    renderTeam : function(){
        var newTag = null;
        var team = null;
        var style = null;
        this.teamWorks.forEach(element => {
            /*
            if(element.status == 'afk' || element.students.length == 1){
                style = 'border:2px solid #f00;';
            }else{
                style = 'border:2px solid #650164';
            }*/
            team = element.id;
            newTag = this.$('#list-activity-regrup').hide().fadeIn('slow').append(
                $('<div>',{
                    id: 'team-'+element.id,
                    class : 'list-student-status',
                    style : 'text-align:center; margin: 1rem;'+style,
                    ondragstart: "startDragTeam(event)",
                    draggable: "true",
                    ondrop: "dropTeam(event)",
                    ondragover: "allowDrop(event)",
                    
                    
                }).append(
                    $('<span>',{
                        id : 'team-name-'+element.id,
                        text : element.nameTeam,
                        class : 'name-team select-chat',
                        name : element.nameTeam
                        
                    })
                ).append(
                    $('<div>',{
                        id : 'content-interger'+element.id,
                        class:'content-interger',
                        style:'display:grid;',
                        
                        
                    })
                ));
            var students = element.students;
            students.forEach(element => {
                $('<span>',{
                    id : 'user-'+element.id,
                    class : 'select-chat select-edit',
                    text : element.name+' '+ element.flastname,
                    name : element.name+' '+ element.flastname,
                    ondragstart: "startDragStudent(event)",
                    draggable: "true",
                }).hide().fadeIn('slow').appendTo('#content-interger'+team);
            });
        });
        this.$('.modal-regrup').fadeIn(400);
    },
});