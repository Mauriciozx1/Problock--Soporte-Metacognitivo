CSLP.Maker.Views.ObjectivesSetter = Backbone.View.extend({

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
        this.setRules(activity.get('rules'));

        //Limpiar la consola
        window.consolePanel.clear();

        window.blocklyPanel.clear();
        //Render intial blockly blocks
        if(this.currentActivity.get('answer'))
            window.blocklyPanel.addInitialBlocks(Blockly.Xml.textToDom(activity.get('answer')));
    },

    //Establece las reglas
    setRules : function(rules) {
        this.rules = rules;
        this.$('input[type=checkbox]').prop('checked', false);
        this.$('input[type=number]').prop('disabled', true).val('5');
        this.renderRules();
        this.toggleExpectedResults();
        this.updateExpectedResults();
    },

    //Renderea las reglas en el panel
    renderRules : function() {
        //Agregando la info de los objetivos
        var rules = this.rules;
        for(var rule in rules) {
            this.$('input.cb-rule[data-rule=' + rule + ']').prop('checked', true);
            this.$('input[type=number][data-rule=' + rule + ']').prop('disabled', false).val(rules[rule].points);

            if(rules[rule].condition === 2) {
                this.$('input.cb-condition[data-rule=' + rule + ']').prop('checked', true);
            }
            //Se deben obtener los resultados esperados si corresponde
            if(rule === 'correct_result')
                this.expectedResults = rules[rule].values || [];
        }
    },

    //Retorna las reglas en base a la info entregada por el panel de objetivos pedagógicos
    getRules : function() {
        var rules = {};
        var self = this;

        this.$('input[type="checkbox"]:checked').each(function() {
            var rule = ($(this).attr('data-rule'));
            rules[rule] = {
                points : parseInt(self.$('input[type=number][data-rule=' + rule + ']').val()),
                condition : self.$('input.cb-condition[data-rule=' + rule + ']').is(':checked') ? 2 : 1
            };
            //Si la regla esesta, se deben agregar los resultados esperados en consola
            if(rule === 'correct_result')
                rules[rule].values = self.expectedResults;
        });

        return rules;
    },

    //Retorna la respuesta propuesta mediante blockly como texto
    getResponse : function() {
        return window.blocklyPanel.toText();
    },

    toggleExpectedResults : function() {
        if(this.$('#frm-cb-results').is(':checked')) {
            this.$('#results-values-container').show();
        } else {
            this.$('#results-values-container').hide();
        }
    },

    updateExpectedResults : function() {
        var HTML = '';
        for(var i in this.expectedResults){
            HTML += '<div class="result-value-row"><span>' + this.expectedResults[i] + '</span><button class="btn-remove-result-value btn-red" data-target="' + i + '"> - </button></div>'
        }
        this.$('.results-values').html(HTML);
    },

    //Establece las reglas basandose en la respuesta propuesta mediante blockly
    updateRules : function() {
        var analisisResults = window.codeTester.analyzeCode(window.codeTester.getCleanCode());
        var testResult = window.codeTester.test();
        var rules = {};

        if(testResult.console_values != undefined && testResult.console_values.length > 0)
            rules.correct_result = {};
        if(analisisResults.statements.variable_declaration != undefined)
            rules.use_variable = {};
        if(analisisResults.statements.if_statement != undefined)
            rules.use_conditional = {};

        if(analisisResults.statements.for_statement != undefined || analisisResults.statements.while_statement != undefined)
            rules.use_loop = {};

        if(analisisResults.statements.function_declaration != undefined)
            rules.use_function = {};

        this.setRules(rules);
        this.$('input[type=number]').val('5');
        this.toggleExpectedResults();
    },

    /**
     * EVENTS
     */

    //Ejecuta el codigo
    runCode : function(event) {

        window.consolePanel.clear();

        var testResult = blocklyPanel.testCode();

        if(testResult.status) {
            window.blocklyPanel.runCode();
            this.updateRules();

        } else {
            blocklyPanel.displayErrorMessage(testResult.error, testResult.blockId);
        }

        //Quita el focus del btn para que pueda cerrarse el tooltip
        $(event.currentTarget).blur();

    },

    //Ejecutado cuando se clickea uno de los checkbox de las reglas pedagógicas
    changeRule : function(event) {
        var cb = $(event.currentTarget);
        var rule = cb.attr('data-rule');
        this.$('input[type=number][data-rule=' + rule + ']').prop('disabled', !cb.is(':checked'));

        if(rule === 'correct_result') {
            this.toggleExpectedResults();
        }
    },

    //EXPECTED RESULTS HANDLERS
    addExpectedResult : function() {
        var value = this.$('#frm-result-value').val();
        if(value){
            this.expectedResults.push(value);
            this.updateExpectedResults();
            this.$('#frm-result-value').val('');
        }
    },

    removeExpectedResult : function(e) {
        //Obtiene el index del valor a elimimnar
        var index = $(e.currentTarget).attr('data-target');
        this.expectedResults.splice(index, 1);
        this.updateExpectedResults();
    }

});