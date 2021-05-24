CSLP.Workboard.Models.Waiting = Backbone.Model.extend({
    defaults : {
        id : 0,
        teamworkid : null,
        activityid : null,
        status : true,
        students : [],
        nusers : 0
        //afks : []
    },
    initialize : function() {
        this.set('nusers', window.usercount);
        this.set('teamworkid',window.teamworkid);
        this.set('activityid', window.activitiId);
        
        
    },
    update : function(students){
        this.set('students', students);
        var temp = this.get('students');
        //
        var statusFinish = window.voteView.modelVote.get('statusFinish');
        console.log(temp);
        //
        console.log(temp.length);
        console.log(statusFinish);
        if(temp.length < this.get('nusers') && statusFinish == false){
            $('.content-info-wait').html('<h4>Hay '+ temp.length +' integrante/s en la actividad grupal de '+ this.get('nusers') +' para comenzar.</h4>');
            $('.wait-group').show();
            this.status=true;
        }
        if(temp.length == this.get('nusers')){
            window.WB.currentActivity.postLider();
            var lider = window.WB.currentActivity.get('lider'); 
            if(lider != null){
                setTimeout(function(){
                    $('.content-info-wait').html('<h4>Generando Líder de Grupo...</h4>');
                },1000);
                setTimeout(function(){
                    $('.content-info-wait').html('<h4>El líder de esta actividad es '+lider.name+' '+ lider.flastname+'</h4>');
                },1000);
            }
                $('.content-info-wait').html('<h4>¡Estan todos listos!, preparando la conexion...</h4>');
                setTimeout(function(){
                    $('.wait-group').hide();
                    this.status = false;
                },2000);
            
        }
        
    },
    });
