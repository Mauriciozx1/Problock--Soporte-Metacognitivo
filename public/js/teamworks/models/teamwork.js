CSLP.Teamworks.Models.Teamwork = Backbone.Model.extend({
    defaults : {
        nameTeam : 'Nuevo equipo',
        studentsCollection : undefined
        
    },

    view : undefined,

    initialize : function() {
        this.initCollection();

        this.generateView();
        this.add(this.get('students'));
    },
    add : function(students){
        for (let i = 0; i < students.length; i++) {
            if(students[i] == null){
                students[i] = {};
            }
        }
        this.getCollection().add(students);
        
        
    },
        
    initCollection : function(){
        this.attributes.studentsCollection = new CSLP.Teamworks.Collections.Students;
        this.getCollection().parent = this;
    },

    getCollection : function(){
        return this.get('studentsCollection');
    },

    generateView : function(){
        this.view = new CSLP.Teamworks.Views.Teamwork({
            model : this
        });
    },

    });

   