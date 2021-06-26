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
                
                this.userOn = data;
                CSLP.message.success('Se ha establecido una conexion');
                console.log(this.userOn);
            })

            .joining(data => {
                this.userOn.push(data);
                window.viewStudentsSection.setStatus(data.user, data.data);
                console.log(this.userOn);
            })

            .leaving(data => {
                this.userOn = this.userOn.filter(d => d.user.id != data.user.id);
                window.viewStudentsSection.setStatus(data.user, {status: 'highlight_off', color: 'red'});
                console.log(this.userOn);
            })

            .listen('.afk', (e)=>{
                CSLP.message.warning(e.user.name + ' se encuentra en estado Ausente.');
                window.viewStudentsSection.setStatus(e.user, {status: 'error_outline', color: 'orange'});
                
            })

            .listen('.change-afk', (e)=>{
                window.viewStudentsSection.setStatus(e.user, {status: 'check_circle', color: 'green'});
                
            })


            .listen('.changeTeamStatus', (e)=>{
                console.log(e)
                if(e.data == null || e.data.status == 'new'){
                    window.viewStudentsSection.setStatusTeam(e.teamworks);
                }
                if(e.data.status == 'afkTeam'){
                    if(e.data.status == 'afk'){
                        this.notificationTeam(e.data.teamwork);
                    }
                    window.viewStudentsSection.setStatusTeam(e.teamworks);
                }
                
            })

            .listenForWhisper('update', data => {
                console.log(data);
                window.viewStudentsSection.arrayPrev.push({user: data.user, data: data.data});
            })
            
            .listenForWhisper('messageHelpforTeacher', data => {
                window.chatView.newMessageStudent(data);
                window.viewStudentsSection.newNotification(data);
                
                console.log(data);
            })

    },
    notificationTeam : function(teamwork){
        CSLP.message.warning(teamwork.name + ': Tiene a un integrante esperando cambio de Grupo.');
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