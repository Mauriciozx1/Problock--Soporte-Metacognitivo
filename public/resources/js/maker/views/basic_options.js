CSLP.Maker.Views.BasicOptions = Backbone.View.extend({

    events : {
    },

    currentActivity : undefined,
    editor : undefined,

    initialize : function() {
        this.initTextarea();
    },

    initTextarea : function(){
        this.editor = new wysihtml.Editor("wysihtml-div", { // id of textarea element
            classes: {
                "wysiwyg-text-align-center": 1,
                "wysiwyg-text-align-justify": 1,
                "wysiwyg-text-align-left": 1,
                "wysiwyg-text-align-right": 1
            },
            toolbar:      "wysihtml-toolbar", // id of toolbar element
            parserRules:  wysihtmlParserRules // defined in parser rules set
        });
    },


    setActivity : function(activity){
        this.currentActivity = activity;
        this.editor.setValue(activity.get('resource'));
        this.$('#frm-activity-name').val(activity.get('name'));
    },

    getResource : function()
    {
      return this.editor.getValue();
    },

    getName : function(){
        return this.$('#frm-activity-name').val()
    }

    /**
     * EVENTS
     */


});