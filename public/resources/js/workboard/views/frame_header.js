CSLP.Workboard.Views.FrameHeader = Backbone.View.extend({

    events : {
        'click .activity-info' : 'toggleActivitiesMenu',
        'click #btn-save' : 'save',
        'click #btn-finish' : 'finish'
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
        window.WB.currentActivity.save();
    },

    finish : function() {

        var testResult = blocklyPanel.testCode();

        if(testResult.status) {
            codePanel.updateCode();
            finishModal.show();
        } else {
            blocklyPanel.displayErrorMessage(testResult.error, testResult.blockId);
        }
    }

});