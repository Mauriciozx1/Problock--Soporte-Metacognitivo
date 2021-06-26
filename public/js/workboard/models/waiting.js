CSLP.Workboard.Models.Waiting = Backbone.Model.extend({
    defaults : {
        id : 0,
        teamworkid : null,
        activityid : null,
        status : true,
        students : [],
        nusers : 0,
        //afks : []
    },
    initialize : function() {
        this.set('nusers', window.usercount);
        this.set('teamworkid',window.teamworkid);
        this.set('activityid', window.activitiId);

        
    },
    // Actualizamos los datos del modelo y de la Interfaz
    update : function(students){
        
        var self = this;
        this.set('students', students);
        var temp = this.get('students');
        //
        var statusFinish = window.voteView.modelVote.get('statusFinish');
        console.log(temp);
        //
        console.log(temp.length);
        console.log(statusFinish);
        if(temp.length < self.get('nusers') && statusFinish == false && self.get('status') == true){
            $('.content-info-wait').html('<h4>Hay '+ temp.length +' integrante/s en la actividad grupal de '+ this.get('nusers') +' para comenzar.</h4>');
            $('.wait-group').show();
            self.set('status',true);
        }
        
        if(temp.length == self.get('nusers') && window.statusTeam == null){
            window.WB.currentActivity.postLider();
            var lider = window.WB.currentActivity.get('lider'); 
            if(lider != null){
                setTimeout(function(){
                    $('.content-info-wait').html('<h4>Generando Líder de Grupo...</h4>');
                    
                },900);
                setTimeout(function(){
                    $('.content-info-wait').html('<h4>El líder de esta actividad es '+lider.name+' '+ lider.flastname+'</h4>');
                },1800);
            }

                $('.content-info-wait').html('<h4>¡Estan todos listos!, preparando la conexion...</h4>');
                setTimeout(function(){
                    if(window.tempo.get('id') != 0){
                        clearInterval(window.tempo.get('id'));
                        window.tempo.reset();
                    }
                    if(window.userStatus == 'check_circle'){
                        CSLP.message.warning('AFK');
                        console.log('AFK');
                        window.WB.currentActivity.setAFK();
                        $('#btn-chat-popup-help').prop('disabled', true).hide(400);
                    }

                    if(window.userStatus == 'error_outline'){
                        console.log('NOAFK');
                        $('#btn-chat-popup-help').prop('disabled', false).show(400);
                    }

                    console.log(window.tempo.get('id'));
                    
                    $('.wait-group').hide();
                    
                    self.set('status',false)
                },2000);
            
        }
        if(window.statusTeam){
            $('#chronometer').hide();
            $('#info-wait').html('No puedes realizar esta actividad, ya que eres el único dentro del grupo.');
            $('.content-info-wait').html('<h4>Esperando solicitud de cambio de grupo...</h4>');
            if(window.tempo.get('id') != 0){
                clearInterval(window.tempo.get('id'));
            }
            $('.wait-group').show();
            self.set('status',true);
        }
        
    },
    });
