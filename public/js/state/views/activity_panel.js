CSLP.State.Views.ActivityPanel = Backbone.View.extend({

    events : {
        'click #section-selector > span' : 'panelChange',
        
    },

    currentActivity : undefined,

    initialize : function() {
        
    },

    setActivity : function(activity) {
        if(this.currentActivity !== activity) {
            this.currentActivity = activity;
            window.viewStudentsSection.setActivity(activity);
            window.objectivesSection.setActivity(activity);
            
            this.$('.no-activity-panel').removeClass('active');
        }
        window.statusView.resize();
    },

    /**
     * EVENTS
     */
    //Acctivado cuando se clickea algun de los tabs para cambiar de panel
   
    panelChange : function(event) {
        var tab = $(event.currentTarget);
        if(!tab.hasClass('active')) {
            var section = tab.attr('data-target');
            var select = tab.attr('id');
            $('.selector-option.active').removeClass('active');
            $('#'+select+'').addClass('active');

            $('.section.active').removeClass('active');
            $(section).addClass('active');
            if(tab.attr('data-target') == '#view-students-section') {
                window.viewStudentsSection.viewOn = true;
                $('#badge-list').html('').hide();
                window.viewStudentsSection.notificationView = 0;
                console.log()
            }else{
                window.viewStudentsSection.viewOn = false;
            }
            if(tab.attr('data-target') == '#objectives-section') {
                $('.blocklyToolboxDiv').show();
            }else{
                $('.blocklyToolboxDiv').hide();
            }
        }
    },


});