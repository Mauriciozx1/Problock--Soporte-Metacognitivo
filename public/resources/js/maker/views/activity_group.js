CSLP.Maker.Views.ActivityGroup = Backbone.View.extend({

    tagName : 'div',
    className : 'activity-group',

    events : {
        'click .btn-add' : 'addActivity',
        'click .btn-edit' : 'toggleEditor',
        'click .btn-save' : 'changeName',
        'click .btn-cancel' : 'cancelEdit'
    },

    initialize : function() {

        this.template = _.template($('#activity-group-template').html());

        //Enlazando eventos
        this.listenTo(this.model, 'destroy', this.remove);

        this.render();
        this.$el.appendTo('#activities-menu');

    },

    attachActivity : function(activityView) {
        this.$('.activities-list').append(activityView);
    },

    render : function() {
        var data = this.model.toJSON();

        //Se une el template creado en "initialize", con el data del modelo
        var HTML = this.template(data);

        //Se indica que el contenido de la vista, va a ser el HTML recien creado, de template + data
        this.$el.html(HTML);
    },

    /**
     * EVENTS
     */

    addActivity : function() {
        var act = new CSLP.Maker.Models.Activity({name : 'Nueva Actividad'});
        this.model.addNewActivity(act);
        window.activityPanel.setActivity(act);
        act.view.trigger('click');

    },

    //Abre y cierra el editor del titulo del grupo
    toggleEditor : function() {
        this.$('.group-title').toggle();
        this.$('.group-title-edit').toggle();
    },


    //Cambia el nombre del grupo por el indicado
    changeName : function(){

        var newName = this.$(".frm-group-title").val();

        if(newName !== this.model.get('name')){
            this.$('.group-title-value').html(newName);
            this.model.set('name', newName);
            this.model.save();
        }

        this.toggleEditor();
    },


    //Cancela la edicion del titulo
    cancelEdit : function(){
        //vuelve el valor al estado original en el input
        this.$(".frm-group-title").val(this.model.get('name'));
        //Cierra el editor y abre el titulo
        this.toggleEditor();
    }

});