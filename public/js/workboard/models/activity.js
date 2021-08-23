CSLP.Workboard.Models.Activity = Backbone.Model.extend({
    defaults : {
        id : -1,
        name : '',
        locked : true,
        completed : false,
        resources : '',
        answer : undefined,
        score : 0,
        selected : false,
        rules : undefined,
        successPercent : 0,
        onComplete : false,
        type : '',
        problem_type : '',
        methode : '',
        lider : null,
        imgLider : undefined,
        domLider : null,
        teamwork: null,
        quantitative : 'false',
        qualitative : 'false',
        questions : null,
        questions_answer : null,
        statusUser : null,
    },

    fetched : false,

    view : undefined,

    initialize : function() {
        var score = window.scores[this.get('id')];
        var teamwork = window.teamworkid;
        this.set('statusUser', window.userStatus);
        if(teamwork !== null)
            this.set('teamwork', teamwork);
        if(score !== undefined)
            this.set('score', score);

        //Comprueba si ya se tiene un puntaje, si es asi el ejercicio se establece como terminado.
        if(this.get('score') != 0){
            this.set('locked', false);
            this.set('completed', true);
        }

        this.generateView();

        if(window.app.config.mode != 'fixed') {
            //Obteniendo las reglas
            var rules = window.rules[this.get('identifier')] || {};
            this.set('rules', rules);
            //Obteniendo el toolbos
            var toolbox = window.toolboxs[this.get('identifier')] || undefined;
            this.set('toolbox', toolbox);
        }else{
            this.set('toolbox', fixedToolbox[this.get('id')]);
        }
    },

    //Obtiene la informacion de la actividad del servidor
    fetchInfo : function() {
        //crear una variable que guardara la accion del evento.
        var interaction = '';
        //Si ya contiene la informacion necesaria
        
        if(this.fetched) {
            //existe data de la actividad por tanto es el cambio a una actividad ya ingresada con anterioridad.
            interaction = 'Cambio de actividad';
            window.WB.renderActivityInfo();
            window.WB.setLoading(false);
            //Enviamos interracion para registrar en el historial.
        } else {
            //No existe data de la actividad por tanto es un nuevo acceso.
            interaction = 'Nuevo acceso a actividad';
            //Solicita la informacion al backend
            var self = this;
            $.get(basePath + '/workboard/activityinfo/' + this.get('id'), function(response) {
                self.set('answer', response.answer || '');
                self.set('score', response.score || 0);
                self.set('teamwork', response.idTeamwork || 0);
                self.set('statusUser', response.status);
                window.teamworkid = response.idTeamwork;
                console.log(response);
                window.WB.renderActivityInfo();
                self.fetched = true;
                window.WB.setLoading(false);
            });
        }
        this.sendInteraction(interaction, null);
    },
    sendInteraction : function(interaction, data){
        var self = this;
        //enviamos el registro de la interaccion.
        $.post(basePath + '/workboard/interaction', {
            activity_id : self.get('id'),
            action: interaction,
            data: data
        }, function(response) {
            //
        });
    },
    //Genera la vista asociada a
    generateView : function() {
        this.view = new CSLP.Workboard.Views.ActivityRow({
            model : this
        });
    },
    setAFK : function() {
        //Enviar Estado Ausente.
        var self = this;
        var time = 0;
        var tempoAfk = setInterval(function(){
            time++;
            console.log(tempoAfk);
            window.tempo.set('id_afk', tempoAfk);
            //5 minutos envia el evento de estado AFK.
            if(time == 300){
                $.post(basePath + '/workboard/state', {
                    activity_id : self.get('id'),
                    status : 'afk',  
                }, function(response) {
                    $('#btn-chat-popup-help').prop('disabled', false).show(400);
                    CSLP.message.success('<span>Se ha habilitado la función "Ayuda". <br>Puedes comunicarte con el Profesor presionando el botón.</span>');
                    window.tempo.set('id_afk', 0);
                    self.set('statusUser', 'error_outline');
                });
                this.sendInteraction('Se encuentra ausente', null);
                clearInterval(tempoAfk);
            }
        },1000);
        
        console.log(window.tempo.get('id_afk'));
    },
    setOfflineAFK : function(){
        //Estado de Usuario Desconectado por mas de 10 minutos.
        var self = this;
        var online = window.chatView.online;
        //CSLP.message.warning('AFK');
        console.log('afkTeam');
        $.post(basePath + '/workboard/state', {
            activity_id : self.get('id'),
            status : 'afkTeam',
            teamwork_id : self.get('teamwork'),
            online : online,
        }, function(response) {
            CSLP.message.warning('Se ha notificado al profesor la ausencia de integrantes dentro del equipo.');
            //window.WB.modelWait.set('status', false);
            $('.loading-container-restart').addClass('active');
            if(online.length > 1){
                Echo.join('chat-team.'+self.get('teamwork'))
                    .whisper('updateTeam',online.length)
            }
            window.voteView.modelVote.set('nusers', online.length);
            window.usercount = online.length;
            this.sendInteraction('Cambio de equipo de trabajo', null);
            setTimeout(function(){
                window.WB.updateWaiting();
                $('.loading-container-restart').removeClass('active');
            },1000);
            
            
        });
            
        
    },
    changeStatus : function(){
        var self = this;
        //CSLP.message.warning('AFK');
        console.log('online');
        $.post(basePath + '/workboard/state', {
            activity_id : self.get('id'),
            status : 'online'  
        }, function(response) {
            $('#btn-chat-popup-help').prop('disabled', true).hide(400);
        });
        this.sendInteraction('Cambia su estado ausente', null);
    },
    //Guarda el progreso de la actividad en el servidor
    save : function(withMessage) {
        withMessage = (withMessage !== undefined) ? withMessage : true;
        $.post(basePath + '/workboard/answer', {
            activity_id : this.get('id'),
            answer : this.get('answer'),
            score : this.get('score'),
            methode : this.get('methode'),
            teamworkid : this.get('teamwork'),
            imgLider : this.get('imgLider'),
            questions_answer : this.get('questions_answer')
            
        }, function(response) {
            if(response != null && withMessage){
                switch(response){
                    case 0:
                        CSLP.message.success('Respuesta Grupal Guardada');
                        break;
                    case 1:
                        CSLP.message.success('Respuesta Guardada');
                        break;
                    case 2:
                        CSLP.message.warning('Haz iniciado la votación');
                        break;
                }
            } 
        });
    },
    //Generamos el lider de la actividad, si hay retorna el lider que ya existe.
    postLider : function(){
        var self = this;
            $.post(basePath + '/workboard/lider/', {
                activityid : this.get('id'),
                teamworkid : window.teamworkid,

            }, function(response) {
                if(response.lider != null){
                    self.set('lider', response.lider);
                    console.log(response.lider);
                    window.WB.renderActivityTeam();
                    this.sendInteraction('Proceso de creación de un Líder', response.lider);
                }    
            });
            
    },
    
    

});
