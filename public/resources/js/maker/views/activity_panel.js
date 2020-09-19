CSLP.Maker.Views.ActivityPanel = Backbone.View.extend({

    events : {
        'click #section-selector > span' : 'panelChange',
        'click .btn-save' : 'saveActivity',
        'click .btn-delete' : 'deleteActivity'
    },

    currentActivity : undefined,

    initialize : function() {

    },

    setActivity : function(activity) {
        if(this.currentActivity !== activity) {
            this.currentActivity = activity;

            window.basicOptionsSection.setActivity(activity);
            window.objectivesSection.setActivity(activity);

            this.$('.no-activity-panel').removeClass('active');
        }
    },

    /**
     * EVENTS
     */

    //Acctivado cuando se clickea algun de los tabs para cambiar de panel
    panelChange : function(event) {
        var tab = $(event.currentTarget);
        if(!tab.hasClass('active')) {
            this.$('section').toggleClass('active');
            this.$('#section-selector > span').toggleClass('active');

            //Ocultando la barra de herramientas de blockly
            if(tab.attr('data-target') == '#objectives-section') {
                $('.blocklyToolboxDiv').show();
            } else {
                $('.blocklyToolboxDiv').hide();
            }
        }
    },

    deleteActivity : function() {

        var response = confirm('¿Seguro que quiere eliminar esta actividad?');
        if(response) {
            this.currentActivity.delete();
            this.currentActivity = new CSLP.Maker.Models.Activity({});
            window.basicOptionsSection.setActivity(this.currentActivity);
            window.objectivesSection.setActivity(this.currentActivity);

            //Quita el panel de edicion de actividad
            this.$('.no-activity-panel').addClass('active');

            window.makerView.resize();
            //Ajusta el tamaño del panel de blockly en base al nuevo ancho establecido
            //Blockly se ajusta solo cuando se lanza un evento de resize en el window
            window.dispatchEvent(new Event('resize'));
        }
    },

    saveActivity : function() {
        this.currentActivity.attributes.name = window.basicOptionsSection.getName();
        this.currentActivity.attributes.resource = window.basicOptionsSection.getResource();
        this.currentActivity.attributes.rules = window.objectivesSection.getRules();
        this.currentActivity.attributes.answer = window.objectivesSection.getResponse();

        this.currentActivity.trigger('change');
        this.currentActivity.view.$el.trigger('click');

        this.currentActivity.save();

        window.makerView.resize();
        //Ajusta el tamaño del panel de blockly en base al nuevo ancho establecido
        //Blockly se ajusta solo cuando se lanza un evento de resize en el window
        window.dispatchEvent(new Event('resize'));
    }

});