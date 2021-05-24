CSLP.State.Views.Status = Backbone.View.extend({

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
        this.connection();

    },
    connection : function(){
        console.log(window.idProblem);
        Echo.join('status.'+window.idProblem)
            .here(user =>{
                CSLP.message.success('Se ha establecido una conexion');
            })

            .joining(user => {
                window.viewStudentsSection.setStatus(user, 'on');
            })

            .leaving(user => {
                window.viewStudentsSection.setStatus(user, 'off');
            })
            .listenForWhisper('update', data => {
                window.viewStudentsSection.updateStatus(data);
                
            });

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