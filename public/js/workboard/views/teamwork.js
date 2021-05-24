CSLP.Workboard.Views.Teamwork= Backbone.View.extend({

    className : 'teamwork',
    tagName : 'div',

    events : {

    },

    initialize : function(){
        this.template = _.template($('#teamwork-template').html());

        //Enlazando eventos
        this.listenTo(this.model, 'change', this.render);
        this.listenTo(this.model, 'delete', this.remove);
        var self = this;
        
        this.$el.appendTo('#teamwork');
        this.render();
    },
    attachStudent : function(View) {
        this.$('.teamwork-list').append(View);

        
    },
    
    render : function(){
        var data = this.model.toJSON();


        //Se une el template creado en "initialize", con el data del modelo
        var HTML = this.template(data);

        //Se indica que el contenido de la vista, va a ser el HTML recien creado, de template + data
        this.$el.html(HTML);
    },

    /**
     * EVENTS
     */


});