CSLP.Maker.Views.Maker = Backbone.View.extend({

    events : {
    },

    jWindow : undefined,
    jFrame : undefined,

    currentActivity : undefined,

    initialize : function() {

        //Reajuste de la pantalla de trabajao dependiendo del cambio de tamaño de la ventana
        this.jWindow = $(window);
        this.jFrame = this.$el;

        var self = this;
        this.jWindow.bind('resize', function() {
            self.resize();
        });

        this.resize();
    },


    //Reajusta el tamaño del panel de trabajo en razon del tamaño de la ventana
    resize : function() {
        var height = this.jWindow.height() - this.jFrame.offset().top;

        this.jFrame.height(height);

        window.blocklyPanel.resize();
    },

    /**
     * EVENTS
     */



});