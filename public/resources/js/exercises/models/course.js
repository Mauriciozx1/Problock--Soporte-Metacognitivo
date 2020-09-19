CSLP.Exercises.Models.Course = Backbone.Model.extend({

    defaults : {
        name : '',
        code : ''
    },

    exercises : undefined,

    initialize : function() {
        this.generateCollection();
        this.addExercise(this.get('problems'));

        this.generateView();
    },

    generateCollection : function() {
        this.exercises = new CSLP.Exercises.Collections.Exercises;
    },

    generateView : function() {
        this.view = new CSLP.Exercises.Views.Course({
            model : this
        });
    },

    getCollection : function() {
        return this.collection;
    },

    showProblems : function() {
        this.exercises.forEach(function(model) {
            model.view.show()
        });
    },

    addExercise : function(data) {
        this.exercises.add(data);

    }
});