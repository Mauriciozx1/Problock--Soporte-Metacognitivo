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
        questions_answer : null
    },

    fetched : false,

    view : undefined,

    initialize : function() {
        var score = window.scores[this.get('id')];
        var teamwork = window.teamworkid;
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
        //Si ya contiene la informacion necesaria
        console.log(this.fetched)
        if(this.fetched) {
            window.WB.renderActivityInfo();
            
            window.WB.setLoading(false);
        } else {
            var self = this;
            //Solicita la informacion al backend
            $.get(basePath + '/workboard/activityinfo/' + this.get('id'), function(response) {
                self.set('answer', response.answer || '');
                self.set('score', response.score || 0);
                self.set('teamwork', response.idTeamwork || 0);
                window.userStatus = response.status;
                window.teamworkid = response.idTeamwork;
                console.log(response);
                window.WB.renderActivityInfo();
                self.fetched = true;
                window.WB.setLoading(false);
            });
        }
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
        var tempoAfk = setTimeout(function(){
            //CSLP.message.warning('AFK');
            console.log('afkUser');
            $.post(basePath + '/workboard/state', {
                activity_id : self.get('id'),
                status : 'afk',  
            }, function(response) {
                $('#btn-chat-popup-help').prop('disabled', false).show(400);
                CSLP.message.success('<span>Se ha habilitado la función "Ayuda". <br>Puedes comunicarte con el Profesor presionando el botón.</span>');
                window.tempo.set('id_afk', 0);
            });
            
        },300000);
        window.tempo.set('id_afk', tempoAfk);
         
    },
    setOfflineAFK : function(){
        //Estado de Usuario Desconectado por mas de 10 minutos.
        var self = this;
        //CSLP.message.warning('AFK');
        console.log('afkTeam');
        $.post(basePath + '/workboard/state', {
            activity_id : self.get('id'),
            status : 'afkTeam',
            teamwork_id : self.get('teamwork')
        }, function(response) {
            CSLP.message.warning('Se ha notificado al profesor la ausencia de integrantes dentro del equipo.');
            //window.WB.modelWait.set('status', false);
            $('.loading-container-restart').addClass('active');
            setTimeout(function(){
                location.reload();
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
        
    },
    //Guarda el progreso de la actividad en el servidor
    save : function(withMessage) {
        console.log(this);
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
                }    
            });
            
    },
    
    

});
