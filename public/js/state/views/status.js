CSLP.State.Views.Status = Backbone.View.extend({

    events : {
        'click .btn-chat' : 'toggleChat',
    },

    jWindow : undefined,
    jFrame : undefined,

    currentActivity : undefined,
    
    userOn : undefined,

    channel : undefined,

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
    
    toggleChat : function(){
        console.log('HOLA');
    },
    connection : function(){
        this.userOn = [];
        Echo.join('status.'+window.idProblem)
            .here(data =>{
                console.log(data)
                CSLP.message.success('Se ha establecido una conexion');
            })

            .joining(data => {
                window.viewStudentsSection.setStatus(data.user, data.data);
                //window.viewStudentsSection.newNotification(user, 'on');
            })

            .leaving(data => {
                window.viewStudentsSection.setStatus(data.user, {status: 'highlight_off', color: 'red'});
                //window.viewStudentsSection.newNotification(user, 'off');
            })
            .listen('.afk', (e)=>{
                CSLP.message.warning(e.user.name + ' se encuentra en estado Ausente.');
                window.viewStudentsSection.setStatus(e.user, {status: 'error_outline', color: 'orange'});
                //window.viewStudentsSection.newNotification(user, 'afk');
            })
            .listenForWhisper('update', data => {
                console.log(data);
                window.viewStudentsSection.arrayPrev.push({user: data.user, data: data.data});
            })
            .listenForWhisper('messageHelpforTeacher', data => {
                window.chatView.newMessageStudent(data);
                
                console.log(data);
            })

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