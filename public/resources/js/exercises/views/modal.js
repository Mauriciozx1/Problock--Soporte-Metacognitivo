CSLP.Exercises.Views.Modal = Backbone.View.extend({

    events : {
        'click .modal-fade' : 'toggle',
        'click .btn-save' : 'save',
        'click .btn-cancel' : 'toggle',
        'click .btn-delete' : 'deleteExercise'
    },

    model : undefined,

    initialize : function() {

    },

    render : function() {

    },
    setModel : function(model) {
        if(this.model !== model) {
            this.model = model;
            this.prepareUI();
        }
    },

    prepareUI : function() {

        this.$('#frm-name').val(this.model.get('name'));
        this.$('#frm-description').val(this.model.get('description'));
        this.$('#frm-idate').val(this.model.get('open_at').split(' ')[0]);
        this.$('#frm-itime').val(this.model.get('open_at').split(' ')[1]);
        this.$('#frm-fdate').val(this.model.get('close_at').split(' ')[0]);
        this.$('#frm-ftime').val(this.model.get('close_at').split(' ')[1]);

        if(this.model.get('id')){
            this.$('.btn-delete').css('visibility', 'visible');
        }else{
            this.$('.btn-delete').css('visibility', 'hidden');
        }
    },

    clean : function() {
        this.$('input textarea').val('');
    },

    toggle : function() {
        this.$el.toggle();
    },

    /**
     * EVENTS
     */


    save : function() {

        var data = {
            name : this.$('#frm-name').val().trim(),
            description : this.$('#frm-description').val().trim(),
            open_at : this.$('#frm-idate').val() + ' ' + this.$('#frm-itime').val(),
            close_at : this.$('#frm-fdate').val() + ' ' + this.$('#frm-ftime').val()
        };

        this.model.set('name',data.name);
        this.model.set('description',data.description);
        this.model.set('open_at',data.open_at);
        this.model.set('close_at',data.close_at);

        this.model.save();

        this.toggle();
    },

    deleteExercise : function() {
        var response = confirm('¿Seguro que quiere eliminar este ejercicio?');
        if(response){
            this.model.delete();
            this.toggle();
        }
    }
});