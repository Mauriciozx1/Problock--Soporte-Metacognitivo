CSLP.Maker.Views.Maker = Backbone.View.extend({

    events : {
    },

    jWindow : undefined,
    jFrame : undefined,

    currentActivity : undefined,

    initialize : function() {

        //Reajuste de la pantalla de trabajao dependiendo del cambio de tama�o de la ventana
        this.jWindow = $(window);
        this.jFrame = this.$el;

        var self = this;
        this.jWindow.bind('resize', function() {
            self.resize();
        });

        this.resize();
    },


    //Reajusta el tama�o del panel de trabajo en razon del tama�o de la ventana
    resize : function() {
        var height = this.jWindow.height() - this.jFrame.offset().top;

        this.jFrame.height(height);

        window.blocklyPanel.resize();
    },

    /**
     * EVENTS
     */



});