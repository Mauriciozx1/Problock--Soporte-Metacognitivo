
CSLP.Workboard.Views.ResourcesModal = Backbone.View.extend({

    events : {
        'click .btn-close' : 'close',
        'click .modal-fade' : 'close',
        'click .btn-gotit' : 'close'
    },

    resource : undefined,

    initialize : function() {
        this.$el.detach();
        this.$el.appendTo('body');
    },

    changeResource : function(resource) {
        if(this.resource != resource){
            this.resource = resource;
            this.render();
        }

    },

    //Oculta el modal
    hide : function() {
        this.$el.fadeOut();
    },

    render : function() {
        this.$('.modal-title').html(this.resource.get('title'));
        this.$('.modal-content').html(this.resource.get('content'));
    },

    show : function() {
        this.$el.fadeIn();
    },

    /**
     * EVENTS
     */

    close : function() {
        this.hide();
    }
});