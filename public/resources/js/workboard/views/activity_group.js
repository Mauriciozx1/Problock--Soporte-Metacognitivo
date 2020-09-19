CSLP.Workboard.Views.ActivityGroup = Backbone.View.extend({

    tagName : 'div',
    className : 'activity-group',

    events : {
        'click .list-header' : 'toggleList'
    },

    initialize : function() {

        this.template = _.template($('#activity-group-template').html());

        //Enlazando eventos
        this.listenTo(this.model, 'destroy', this.remove);
        this.listenTo(this.model, 'completed', this.complete);
        this.listenTo(this.model, 'change', this.renderStatus);

        var self = this;
        this.listenTo(this.model, 'add-activity', function(model) {
            self.attachActivity(model.view.$el);
        });

        this.render();
        this.$el.appendTo('#activity-groups');

    },

    attachActivity : function(activityView) {
        this.$('.activities-list').append(activityView);
    },

    render : function() {
        var data = this.model.toJSON();

        this.renderStatus();

        //Se une el template creado en "initialize", con el data del modelo
        var HTML = this.template(data);

        //Se indica que el contenido de la vista, va a ser el HTML recien creado, de template + data
        this.$el.html(HTML);
    },

    //Renderea el estado del grupo
    renderStatus : function() {
        var data = this.model.toJSON();

        //Remueve todas las clases que pueda ya tener asignadas
        this.$el.attr('class', 'activity-group');

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

        this.$('.status-icon').html(data.icon);
    },

    /**
     * EVENTS
     */

    //Despliega/Cierra el listado de actividades
    toggleList : function() {
        this.$('.activities-list').slideToggle();
        //Detiene la propagacion del evento para que no se cierre el menu
        return false;
    },

    complete : function(){
        this.model.set('complete', true);
    }

});