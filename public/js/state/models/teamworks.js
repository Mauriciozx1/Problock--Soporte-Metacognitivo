CSLP.State.Models.Teamworks = Backbone.Model.extend({

    defaults : {
        idProblem : 0,
        teamworks: [],
    },

    initialize : function() {
        this.set('idProblem',window.idProblem);
        this.set('teamworks', window.infoTeamworks);
    },
    postData : function(){
        var self = this;

        $.post(basePath + '/teacher/teamwork', {
            problem_id : self.get('idProblem'),
            teamworks : self.get('teamworks')

        }, function(response) {
            CSLP.message.success('Los cambios han sido aplicados, correctamente.');
            console.log(JSON.parse(response));
            window.regrups.close();
            
            var Team = JSON.parse(response);
            window.statusView.userOn.forEach(element => {
                var user = element.user.id;
                var data = element.data;
                Team.forEach(element =>{
                    element.students.forEach(element => {
                        
                        if(element.id == user){
                            element.color = data.color;
                            element.status = data.status;
                        }
                        
                    });
                });
            });
            window.viewStudentsSection.teamWorks = Team;
            console.log(Team);
            
            window.viewStudentsSection.renderTeam();
            //window.regrups.renderTeam();
        });
    },
    update : function(data){
        var self = this;
        self.set('teamworks', data);
    },
    getTeams : function(){
        var self = this;
        return self.get('teamworks');
    }
    
});