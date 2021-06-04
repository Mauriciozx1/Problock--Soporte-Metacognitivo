CSLP.State.Views.ObjectivesSetter = Backbone.View.extend({

    events : {
        'click #btn-run' : 'runCode',
        'change input.cb-rule[type=checkbox]' : 'changeRule',
        'click #btn-add-result-value' : 'addExpectedResult',
        'click .btn-remove-result-value' : 'removeExpectedResult'
    },

    currentActivity : undefined,

    initialize : function() {

    },

    expectedResults : [],

    //Cambia la actividad con la cual se está trabajando
    setActivity : function(activity) {
        this.currentActivity = activity;

        //Limpiar la consola
        window.consolePanel.clear();

        window.blocklyPanel.clear();
        //Render intial blockly blocks
        if(this.currentActivity.get('answer'))
            window.blocklyPanel.addInitialBlocks(Blockly.Xml.textToDom(activity.get('answer')));
        this.renderInfo();
    },

    /**
     * EVENTS
     */
     renderInfo : function(){
        var txtLista = "<hr><ul>";
        var rules = this.currentActivity.get("rules");
        for(var rule in rules) {

            var isCritic = (rules[rule].condition === 1) ? '*' : '';

            if(rule == "correct_result" && rules[rule].values != null) {
                txtLista += "<li>" + rulesToText[rule] + ": " + rules[rule].values.join(',') + " (" + rules[rule].points + " pts)" + isCritic + "</li>"
            } else {
                txtLista += "<li>" + rulesToText[rule] + " (" + rules[rule].points + " pts)" + isCritic + "</li>"

            }
        }
        txtLista += "</ul>";

        //Render panel de recursos
        this.$('#resources-panel').html('<h1 style="text-align:center;"><b>Información de la Actividad</b></h1>'+this.currentActivity.get('resource') + txtLista);
    
    },
    //Ejecuta el codigo
    runCode : function(event) {

        window.consolePanel.clear();

        var testResult = blocklyPanel.testCode();

        if(testResult.status) {
            window.blocklyPanel.runCode();
            

        } else {
            blocklyPanel.displayErrorMessage(testResult.error, testResult.blockId);
        }

        //Quita el focus del btn para que pueda cerrarse el tooltip
        $(event.currentTarget).blur();

    },

   
});