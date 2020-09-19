CSLP.Workboard.Views.FinishModal = Backbone.View.extend({

    events : {
        'click .btn-stay' : 'close',
        'click .btn-next' : 'nextActivity',
    },

    resource : undefined,

    initialize : function() {
        this.$el.detach();
        this.$el.appendTo('body');
    },

    //Oculta el modal
    hide : function() {
        this.$el.fadeOut();
        //Desbloquea boton
        this.$('.btn-next').attr('disabled',false).removeClass('btn-gray');
        //Quita mensaje de success
        this.$('#group-success').hide();
    },

    render : function() {

        //Oculta todos los objetivos
        this.$('li').removeClass('visible');

        this.$('.code-panel-container').html($('#javascript-panel').html());
        this.$('.code-lines-count').html(window.codeTester.countCodeLines());

        var totalPoints = 0;
        var obtainedPoints = 0;

        //Obtiene el total de puntos obtenidos en base a las reglas cumplidas
        for(var rule in this.result){
            totalPoints += this.result[rule].points;
            var objetive = this.$('li[data-objetive="'+rule+'"]');
            objetive.addClass('visible');
            objetive.attr('data-points', this.result[rule].points);
            if(this.result[rule].pass){
                obtainedPoints += this.result[rule].points;
                objetive.addClass('completed');
            }else{
                objetive.removeClass('completed');
            }
        }

        var totalPercent = Math.round((obtainedPoints * 100)/totalPoints);

        //Guarda el progreso de la actividad y el score obtenido
        var currentActivity = window.WB.currentActivity;
        currentActivity.set('successPercent', totalPercent);

        //Guarda el score obtenido en la actividad
        currentActivity.set('score', totalPercent);
        currentActivity.set('answer', window.blocklyPanel.toText());
        currentActivity.save(false);

        this.$('.obtained-points').html(obtainedPoints);
        this.$('.total-points').html(totalPoints);
        this.$('.total-percent').html(totalPercent);

        //Checkea si es final de grupo
        if(currentActivity.get('onComplete') !== false){
            //Bloque el boton de siguiente
            this.$('.btn-next').attr('disabled',true).addClass('btn-gray');

            var totalSuccessPercent = currentActivity.collection.parent.calculateSuccess();


            var requestData = '<batch-execution lookup="defaultKieSession"><insert out-identifier="pbltask"  return-object="true"><unab.pt.cslp.pblTask><score>' + totalSuccessPercent + '</score></unab.pt.cslp.pblTask></insert><fire-all-rules/></batch-execution>';

            var user = "workbench";
            var pwd = "workbench1!";
            
            var self = this;

            $.ajax({
                type: "POST",
                url: "http://localhost:8080/kie-server/services/rest/server/containers/instances/cslpserver",
                dataType: "xml",
                contentType: "application/xml",
                headers: {
                    "X-KIE-ContentType":"XSTREAM",
                    "Access-Control-Allow-Origin":"*",
                    "Access-Control-Allow-Headers":"*",
                    "Access-Control-Allow-Methods": "GET, PUT, POST, DELETE, OPTIONS",
                    "Access-Control-Allow-Credentials" : "true",
                    "Authorization" : "Basic " + btoa(user + ":" + pwd)
                },
                crossDomain : true,
                data: requestData,
                success: function (res) {
                    var xml = new XMLSerializer().serializeToString(res.documentElement);
                    var success = $(xml).find('success').html();
                    //Consulta si cumple con el % minimo
                    if(success != "false"){
                        //Desbloquea boton
                        self.$('.btn-next').attr('disabled',false).removeClass('btn-gray');
                        //Quita mensaje de success
                    }else{
                        self.$('#group-success-required').html(75 + '%');
                        self.$('#group-success-percent').html(totalSuccessPercent+ '%');
                        self.$('#group-success').show();
                    }
                },
                error: function (res) {
                    console.log("Drools Request Failed! " + res);

                    //Consulta si cumple con el % minimo
                    var requiredSuccess = 75;
                    if(totalSuccessPercent >= requiredSuccess){
                        //Desbloquea boton
                        self.$('.btn-next').attr('disabled',false).removeClass('btn-gray');
                        //Quita mensaje de success
                    }else{
                        self.$('#group-success-required').html(requiredSuccess+ '%');
                        self.$('#group-success-percent').html(totalSuccessPercent+ '%');
                        self.$('#group-success').show();
                    }
                }
            });

        }
    },

    show : function() {

        this.result = codeTester.checkRules();

        for(var rule in this.result){
            if(this.result[rule].condition === 1 && !this.result[rule].pass){
                CSLP.message.info("Recuerda que debes cumplir con " + rulesToText[rule]);
                return;
            }
        }

        this.render();
        this.$el.fadeIn();
    },

    /**
     * EVENTS
     */

    close : function() {
        this.hide();
    },

    nextActivity : function(){
        window.WB.nextActivity();
        this.close();
    }
});