CSLP.Workboard.Models.Waiting = Backbone.Model.extend({
    defaults : {
        id : 0,
        teamworkid : null,
        activityid : null,
        status : true,
        students : [],
        nusers : 0,
        //afks : [],
        userStatus : null,
        tempoAFK : false,
    },
    initialize : function() {
        this.set('nusers', window.usercount);
        this.set('teamworkid',window.teamworkid);
        this.set('activityid', window.activitiId);
        this.set('userStatus', window.userStatus);
        console.log(window.problemid);
        
    },
    // Actualizamos los datos del modelo y de la Interfaz
    update : function(students){
        
        var self = this;
        this.set('students', students);
        var temp = students;
        //
        var statusFinish = window.voteView.modelVote.get('statusFinish');
        console.log(temp);
        console.log(window.usercount);
        console.log(window.chatView.online);
        console.log(self.get('status'));
        if(temp.length < window.usercount && statusFinish == false && self.get('status') == true){         
            $('.content-info-wait').html('<h4>Hay '+ temp.length +' integrante/s en la actividad grupal de '+ window.usercount +' para comenzar.</h4>');
            $('.wait-group').show();
            //self.set('status',true);
            
        }
        //
        if(temp.length == window.usercount && window.statusTeam == null && self.get('status') == false){
            window.WB.currentActivity.postLider();
            var lider = window.WB.currentActivity.get('lider'); 
            
            /*if(lider == null){
                window.WB.currentActivity.postLider();
            }*/
            if(lider != null){
                setTimeout(function(){
                    $('.content-info-wait').html('<h4>Generando Líder de Grupo...</h4>');
                    
                },900);
                setTimeout(function(){
                    $('.content-info-wait').html('<h4>El líder de esta actividad es '+lider.name+' '+ lider.flastname+'</h4>');
                },1800);
            }

                $('.content-info-wait').html('<h4>¡Estan todos listos!, preparando la conexion...</h4>');
                
                if(window.tempo.get('id') != 0){
                    clearInterval(window.tempo.get('id'));
                    window.tempo.reset();
                }
                if(window.userStatus == 'check_circle' && self.get('tempoAFK') == false){
                    console.log('Estatus: Online');
                    window.WB.currentActivity.setAFK();
                    $('#btn-chat-popup-help').prop('disabled', true).hide(400);
                    self.set('tempoAFK', true);
                }

                if(window.userStatus == 'error_outline'){
                    console.log('Estatus: AFK');
                    $('#btn-chat-popup-help').prop('disabled', false).show(400);
                }

                console.log(window.userStatus);
                
                $('.wait-group').hide();
                
                //self.set('status',false)
            
            
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
    resetActivity : function(){
        var seg = 0;
        var self = this;
        
        
    },
    });
