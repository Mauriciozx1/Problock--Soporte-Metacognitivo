CSLP.Workboard.Views.ActivityRow = Backbone.View.extend({
    tagName : 'li',
    className : '',

    events : {
        'click' : 'selectActivity'
    },

    initialize : function() {
        this.template = _.template($('#activity-row-template').html());

        //Enlazando eventos
        this.listenTo(this.model, 'change', this.render);
        this.listenTo(this.model, 'destroy', this.remove);

        this.render();
    },

    render : function() {
        var data = this.model.toJSON();

        //Remueve todas las clases que pueda ya tener asignadas
        this.$el.attr('class', 'activity-row');

        if(data.locked) {
            this.$el.addClass('locked');
            data.icon = 'lock_outline';
        } else {
            if(data.completed) {
                this.$el.addClass('completed');
                data.icon = 'check';
            } else {
                this.$el.addClass('unlocked');
                data.icon = 'lock_open';
            }
        }

        if(this.model.get('selected'))
            this.$el.addClass('selected');

        //Se une el template creado en "initialize", con el data del modelo
        var HTML = this.template(data);

        //Se indica que el contenido de la vista, va a ser el HTML recien creado, de template + data
        this.$el.html(HTML);
    },

    /**
     * EVENTS
     */

    //Selecciona una actividad en el menu
    selectActivity : function() {
        //Si la actividad no esta bloqueada
        if(!this.model.get('locked')) {
            window.WB.changeActivity(this.model);
        } else {
            //Detiene la propagacion del evento para que no se esconda el menu
            return false;
        }
    }

});
