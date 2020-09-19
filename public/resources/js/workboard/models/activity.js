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
        onComplete : false
    },

    fetched : false,

    view : undefined,

    initialize : function() {
        var score = window.scores[this.get('id')];
        if(score !== undefined)
            this.set('score', score);

        //Comprueba si ya se tiene un puntaje, si es asi el ejercicio ya fue terminado previamente
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
        if(this.fetched) {
            window.WB.renderActivityInfo();
            window.WB.setLoading(false);
        } else {

            var self = this;
            //Solicita la informacion al backend
            $.get(basePath + '/workboard/activityinfo/' + this.get('id'), function(response) {

                self.set('answer', response.answer || '');
                self.set('score', response.score || 0);

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

    //Guarda el progreso de la actividad en el servidor
    save : function(withMessage) {

        withMessage = (withMessage !== undefined) ? withMessage : true;

        $.post(basePath + '/workboard/answer', {
            activity_id : this.get('id'),
            answer : this.get('answer'),
            score : this.get('score')
        }, function(response) {
            if(response == 1 && withMessage)
                CSLP.message.success('Respuesta Guardada');
        });
    }

});
