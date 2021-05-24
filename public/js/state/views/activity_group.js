CSLP.State.Views.ActivityGroup = Backbone.View.extend({

    tagName : 'div',
    className : 'activity-group',

    events : {
        'click .btn-add-i' : 'addActivity',
        'click .btn-add-g' : 'toggleAdd',
        'click .btn-edit' : 'toggleEditor',
        'click .btn-save' : 'changeName',
        'click .btn-cancel' : 'cancelEdit',
        'click .btn-cancel-type' : 'cancelAdd',
        'click .btn-save-type' : 'addActivity',
    },

    initialize : function() {

        this.template = _.template($('#activity-group-template').html());

        //Enlazando eventos
        this.listenTo(this.model, 'destroy', this.remove);

        this.render();
        this.$el.appendTo('#activities-menu');
        this.$('.activities-type').hide();
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
        var strUser = this.$("#select-type-activities").val();
        var act = new CSLP.State.Models.Activity({name : 'Nueva actividad'});
        if(strUser  != null){
            if(strUser == 1) {
                var type = 'Individual';
            }
            if(strUser == 2){
                var type = 'Grupal';
            }
            this.model.addNewActivity(act,type);
            window.activityPanel.setActivity(act);
            act.view.trigger('click');
            this.$('.no-activity-panel').addClass('active');
            this.toggleAdd();
        }else{
            var type = 'Individual'
            this.model.addNewActivity(act,type);
            window.activityPanel.setActivity(act);
            act.view.trigger('click');
            this.$('.no-activity-panel').addClass('active');
            this.toggleAddI();
        }

    },
    //Abre y cierra el editor del titulo del grupo
    toggleEditor : function() {
        this.$('.group-title').toggle();
        this.$('.group-title-edit').toggle();
    },

    toggleAdd : function() {
        this.$('.btn-add-g').toggle();
        this.$('.activities-type').toggle();
    },
    toggleAddI : function() {
        //this.$('.btn-add-i').toggle();
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
    },

    cancelAdd : function(){
        this.toggleAdd();
    }

});