CSLP.Workboard.Collections.ActivityGroups = Backbone.Collection.extend({

    model : CSLP.Workboard.Models.ActivityGroup,

    progress : 0,

    initialize : function(){
        var self = this;
        this.on('add', function(model){
            model.on('change',function(){
                self.calculateProgress();
            });

            self.calculateProgress();
        });
    },

    calculateProgress : function(){
        var totalActivities = 0;
        var completedActivities = 0;

        this.forEach(function(model){
            model.forEach(function(subModel){
                totalActivities++;
                if(subModel.get('completed'))
                    completedActivities++;
            });
        });

        var progress = Math.round((completedActivities * 100)/totalActivities);
        if(this.progress != progress){
            this.progress = progress;
            this.trigger('change-progress');
        }

    }
});