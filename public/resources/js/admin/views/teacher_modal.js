CSLP.Admin.Views.TeacherModal = Backbone.View.extend({

    events : {
        'click .btn-submit' : 'handleSubmit',
        'click .modal-fade' : 'toggle'
    },

    model : undefined,

    initialize : function() {

    },

    changeModel : function(model) {
        this.model = model;
    },

    clean : function() {
        this.$('input').val('');
    },

    toggle : function() {
        this.$el.toggle();
    },

    save : function() {
        var data = $('#signup-form').serializeArray();
        for(var index in data){
            this.model.set(data[index].name, data[index].value);
        }
        if(this.model.get('id') === undefined)
            window.collections.teachers.add(this.model);
        this.model.save();
    },

    /**
     * EVENTS
     */

    handleSubmit : function(e) {
        e.preventDefault();
        this.save();
        this.clean();
        this.toggle();
    }

});
