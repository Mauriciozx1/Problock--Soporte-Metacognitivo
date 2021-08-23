CSLP.State.Models.Interactions = Backbone.Model.extend({

    defaults : {
        idProblem : 0,
        nameProblem: '',
        data: [],
    },

    initialize : function() {
        this.set('idProblem',window.idProblem);
        this.getInteracion();
    },
    getInteracion : function(){
        var self = this;
        $.get(basePath + '/teacher/interaction/' + window.idProblem, function(response) {  
            self.set('data', response);
            self.set('nameProblem', response[0].problem.name);
            self.render();
        });
        
    },
    render : function(){
        var self = this;
        var data = self.get('data');
        $('#body-simple-table').html('');
        data.forEach(element => {
            var nameUser = element.user.name+' '+element.user.flastname+' '+element.user.mlastname;
            $('<tr>').append(
                
                $('<td>', {
                    text: element.allDataDB.created_at
                })
            ).append(
                //usuario
                $('<td>', {
                    text: nameUser
                })
            ).append(
                //actividad
                $('<td>', {
                    text: element.activity.name
                })
            )
            .append(
                //accion
                $('<td>', {
                    text: element.type
                })
            ).hide().appendTo('#body-simple-table').fadeIn('slow');
            $('#list-interactions').animate({ scrollTop: $('#log-resources-panel').height() }, 2500);
        });
    }
});