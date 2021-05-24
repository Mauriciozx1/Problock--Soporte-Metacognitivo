CSLP.Workboard.Views.FrameHeader = Backbone.View.extend({
    
    events : {
        'click .activity-info' : 'toggleActivitiesMenu',
        'click #btn-finish' : 'finish',
        'click #btn-save' : 'save',
        'click #btn-finish-group' : 'finishGroup',
        
        
        
    },

    initialize : function() {
        this.listenTo(window.collections.activityGroups, 'change-progress', this.renderProgress);

    },

    /**
     * EVENTS
     */
    
    
    toggleActivitiesMenu : function(e) {
        $('#activities-menu').toggleClass('visible');
        return false;
    },

    renderProgress : function() {
        this.$('#progress-bar').animate({width : window.collections.activityGroups.progress + '%'});
    },

    //Guardar la respuesta actual
    save : function() {
        window.WB.currentActivity.set('answer', window.blocklyPanel.toText());
        window.WB.currentActivity.set('methode','save');
        window.WB.currentActivity.save();
    },

    finish : function() {
        var testResult = blocklyPanel.testCode();
        if(testResult.status) {
            window.WB.currentActivity.set('methode','save');
            codePanel.updateCode();
            finishModal.show();
            //window.WB.currentActivity.save(false);
        } else {
            blocklyPanel.displayErrorMessage(testResult.error, testResult.blockId);
        }
    },
  

    finishGroup : function() {
        var testResult = blocklyPanel.testCode();
        if(testResult.status) {
            codePanel.updateCode();
            window.WB.currentActivity.set('methode','vote');
            finishModal.show();
            window.WB.currentActivity.save(false);
            //$('.finish-modal').hide();
            
            
        } else {
            blocklyPanel.displayErrorMessage(testResult.error, testResult.blockId);
        }
    },
});