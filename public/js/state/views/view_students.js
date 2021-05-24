CSLP.State.Views.ViewStudents = Backbone.View.extend({

    events : {
        'click #btn-run' : 'runCode',
        'change input.cb-rule[type=checkbox]' : 'changeRule',
        'click #btn-add-result-value' : 'addExpectedResult',
        'click .btn-remove-result-value' : 'removeExpectedResult'
    },

    currentActivity : undefined,

    teamWorks : [],

    teamStudents : [],

    status : [],

    students : [],

    initialize : function() {
        this.teamWorks = window.infoTeamwork;
        this.students = window.students;
    },

    //Cambia la actividad con la cual se está trabajando
    setActivity : function(activity) {
        this.currentActivity = activity;
        console.log(this.teamWorks);
        this.render();
    },
    render : function(){
        if(this.currentActivity.get('problem_type') == 'Grupal'){
            this.renderTeam();
        }else{
            this.students.forEach(element => {
                
            });
            //Renderizar lista de estudiantes
            console.log(this.students);

        }
    },
    renderTeam : function(){
        var arrayStudents = [];
        this.teamWorks.forEach(element => {
            if(this.currentActivity.get('type') == 'Grupal'){
                //Renderizar grupos con sus estudiantes 
                var students = element.students;
                students.forEach(element => {
                    this.teamStudents.push(element);
                }); 
            }else{
                var students = element.students;
                students.forEach(element => {
                    this.teamStudents.push(element);
                });
                
            //Renderizar lista de estudiantes
            }
        });
        
        //console.log(this.teamStudents);
    },
    setStatus : function(user, type){

    },
    updateStatus : function(data){

    }
});