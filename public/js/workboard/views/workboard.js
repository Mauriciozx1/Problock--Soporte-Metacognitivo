CSLP.Workboard.Views.Workboard = Backbone.View.extend({

    events : {
        'click #panel-selector > span' : 'panelChange',
        'click #btn-run' : 'runCode',
        'click #btn-stop' : 'stopExecution',
        'click #btn-step' : 'runStep',
        'change #by-steps' : 'toggleBySteps',
        'mousedown .h-resizer-bar' : 'hresizerUnlock',
        'mousedown .v-resizer-bar' : 'vresizerUnlock',
        'mouseup' : 'resizerLock',
        'mousemove' : 'resizePanel',
        'click #btn-chat-popup' : 'toggleChat',
        'click #btn-chat-popup-help' : 'toggleChatHelp',
        'click #btn-live-lider' : 'toggleShare',
        'click #button-popup-share' : 'viewShare',
        'click #button-popup-screen' : 'sendIMG',
        'click #button-view-menu' : 'viewMenu'
        
        
    },

    jWindow : undefined,
    jFrame : undefined,

    isHResizerLocked : true,
    isVResizerLocked : true,

    bySteps : false,

    currentActivity : undefined,

    currentWait : undefined,
    
    wait : [],

    prevActivity :null,

    user : undefined,

    screen : undefined,
    
    chat : undefined,

    nNewMessage : 0,

    nNewScreen : 0,

    initialize : function() {
        //Reajuste de la pantalla de trabajao dependiendo del cambio de tama�o de la ventana
        this.jWindow = $(window);
        this.jFrame = this.$('#frame-content');
        var self = this;
        this.jWindow.bind('resize', function() {
            self.resize();    
        });
        this.resize();
        this.$('.badge').hide();
        this.$('.badge-popup-button-parent').hide();
        this.$('.badge-view-share').hide();
        console.log(window.teamworkid);
        console.log(window.userStatus);
        var channel = Echo.join('status.'+ window.problemid);
        channel.joining(data =>{
            if(data.user.type == 'teacher'){
                if(window.userStatus){
                    channel.whisper('update',{user: window.user, data : {status: window.userStatus, color: 'orange'}});
                }else{
                    channel.whisper('update',{user: window.user, data : {status : 'check_circle', color: 'green'}});
                }
            }
        })
        channel.listenForWhisper('messageHelp', data =>{
            
            if(data.id == window.user.id){
                console.log(data);
                window.chatHelp.message = data;
                window.chatHelp.newMessage();
            }
            if(window.teamworkid == data.id){
                //window.chatHelp.newMessageTeam(data.message);
                console.log(data);
            }
        })
        
    },
    sendIMG : function(){
        if($('.screen-popup').is(':visible')){
            $('.screen-popup').hide();
        }
        $('.loading-container').hide();
        html2canvas(document.querySelector("#workboard")).then(
            canvas =>{
                var img = canvas.toDataURL();
                var data = {id : window.studentUser.id, name : window.studentUser.name+' '+window.studentUser.flastname, img : img};
                Echo.join('workspace.'+ window.activitiId+window.teamworkid)
                    .whisper('shareScreen', data);
                CSLP.message.success('Desarrollo enviado correctamente');
            })
    },
    viewShare : function(){
        this.screen.show();
        this.nNewScreen = 0;
        this.$('.badge-view-share').fadeOut();
        this.$('.badge-view-share').html("");
        this.$('.badge-popup-button-parent').fadeOut();
        this.$('.badge-popup-button-parent').html("");
        
    },
    toggleShare : function(){
        this.nNewScreen = 0;
        $('.button-popup-share').toggle(200);
        $('.button-popup-screen').toggle(300);
        if($('.screen-popup').is(':visible')){
            $('.screen-popup').toggle(200);
        }
    },
    toggleChat : function() {
        if(this.$('.btn-chat-person').is(':visible')){
            this.$('.btn-chat-person').toggle('slow');
            this.$('.btn-chat-group').toggle('slow');
        }
        window.chatView.show();
        console.log($('.p-2').height());
        this.$('.badge').hide();
        this.nNewMessage = 0;
        this.$('.badge').html("");
        $('#list-unstyled').animate({ scrollTop: $('.p-2').height() }, 3000);
        
    },
    toggleChatHelp : function() {
        console.log($('.p-2').height());
        this.$('.badge').hide();
        this.$('.btn-chat-person').toggle('slow');
        this.$('.btn-chat-group').toggle('slow');
        window.chatHelp.show();
        this.nNewMessage = 0;
        this.$('.badge').html("");
        $('#list-unstyled').animate({ scrollTop: $('.p-2').height() }, 3000);
        
    },
    newNotification : function(methode){
        if(methode == 'chat'){
            this.nNewMessage++;
            console.log(this.nNewMessage);
            this.$('.badge').html(""+this.nNewMessage+"");
            this.$('.badge').fadeIn();
        }
        if(methode == 'screen'){
            this.nNewScreen++;
            console.log(this.nNewScreen);
            this.$('.badge-view-share').html(""+this.nNewScreen+"");
            this.$('.badge-popup-button-parent').html(""+this.nNewScreen+"");
            this.$('.badge-view-share').fadeIn();
            this.$('.badge-popup-button-parent').fadeIn();
            
        }
        
    },
    //Cambia la actividad en la que se esta trabajando
    changeActivity : function(activityModel) {
        //Si la actividad seleccionada es distinta que la actual
        
        if(this.currentActivity != activityModel) {
            var isFirst = false;

            if(this.currentActivity == undefined){
                isFirst = true;
            }
            if(this.currentActivity != undefined){
                this.currentActivity.set('selected', false);
            if(this.currentActivity.get('problem_type') == 'Grupal'){
                    Echo.leave('workspace.'+this.currentActivity.get('id')+this.currentActivity.get('teamwork'));
                    
                }
                
            }
            
            this.currentActivity = activityModel;
            this.currentActivity.set('selected', true);
            
            if(this.currentActivity.get('type') == 'Individual' || this.currentActivity.get('type') == null){
                this.$('.buttons-lider').hide();
                this.$('.wait-group').hide();
                this.$('.screen').hide();
                this.$('.buttons').html('<button id="btn-save" class="btn-green">Guardar</button><button id="btn-finish" class="btn-blue">Finalizar</button>');

            }
            if(this.currentActivity.get('type') == 'Grupal'){
                this.$('.buttons-wait').fadeIn(2000);
                window.voteView.cancel();
                this.$('.buttons').html("");
                this.$('badge').hide();
                this.setConectionScreen();
                this.wait = [];
                this.$('.wait-group').show();
                var model = new CSLP.Workboard.Models.Waiting();
                this.setConectionTeam(model);
                this.$('.screen').show();
                this.$('.buttons-lider').show();
                if(this.$('.btn-next-team').is(':visible')){
                    $('.btn-next-team').hide();
                }
                

            }
            this.setLoading(true);
            this.currentActivity.fetchInfo();
            console.log(this.currentActivity);
            if(!window.userStatus){
                //CSLP.message.warning('AFK');
                console.log('AFK');
                this.currentActivity.setAFK();
            }
            
            //Solicitar la carga de los datos del modelo    
        }
        
    },
    
    viewMenu : function(){
        console.log('Hola View Menu');
        $('#activities-menu').toggleClass('visible');
        return false
    },
    setConectionScreen : function(){
        window.screenView = new CSLP.Workboard.Views.ScreenView();
        this.screen = window.screenView;
        Echo.join('workspace.' +this.currentActivity.get('id')+window.teamworkid)
            .listenForWhisper('shareScreen', data =>{
            window.screenView.add(data);
            this.newNotification('screen');
            })
    },
    renderActivityTeam : function(){
        var lider = this.currentActivity.get('lider');
        if(lider.id == window.studentUser.id){
            $('#buttons').html('<h4>Tú eres el Lider de la actividad</h4><div class="buttons-lider"><button id="btn-save" class="btn-green" >Guardar</button><button id="btn-finish-group" class="btn-blue">Finalizar</button></div>');
        }
        if(lider.id != window.studentUser.id){
            $('#buttons').html('<h4>Líder: '+lider.name+' '+ lider.flastname+'</h4>');
        }
        
        
    },
    setConectionTeam : function(modelWait){
        Echo.join('workspace.' +this.currentActivity.get('id')+window.teamworkid)
            .here(user => {
                this.wait.push(user[0]);
                modelWait.update(this.wait);
                this.user = user[0];
            }) 

            .listen('.vote', (e) => {
                this.currentActivity.set('answer',e.data.answer);
                this.currentActivity.set('score', e.data.score);
                var dom = document.getElementById("finish-modal");
                dom.querySelector('.modal-content').innerHTML = e.data.imgLider;
                $('.finish-modal').show();
                window.voteView.imgCapture();
                $('.finish-modal').hide();
                CSLP.message.warning('El líder ha comenzado la votación.');   
            })
            
            .listenForWhisper('update-vote', data =>{
                window.voteView.modelVote.update(data);
                console.log('Listen update Vote');
                console.log(data);
                window.voteView.render();
            })
            //Actualizamos el array a todos los usuarios
            .listenForWhisper('update', data => {
                this.wait = data.arrayWait;
                modelWait.update(this.wait);
                
            })
            
            .joining(user => {
                CSLP.message.success( user.name+' '+user.flastname + ' se ha conectado.');
                this.wait.push(user);
                modelWait.update(this.wait);
                Echo.join('workspace.'+this.currentActivity.get('id')+window.teamworkid)
                    .whisper('update',{arrayWait : this.wait})
                
                
                
            })
            .leaving(user => {
                this.wait = this.wait.filter(u => u.id != user.id);
                CSLP.message.error( user.name+' '+user.flastname + ' se ha desconectado.');
                
                Echo.join('workspace.'+this.currentActivity.get('id')+window.teamworkid)
                    .whisper('update',{arrayWait : this.wait})
                modelWait.update(this.wait);
                if(statusVote == true && statusFinish == false){
                    window.voteView.cancel();
                }
                /*
                if(statusVote == true && statusFinish == true){
                    this.$('.wait-group').fadeOut(0);
                }*/
            })
      
            
    },

    disableStepCheck : function(disable) {
        this.$('#by-steps').attr('disabled', disable);
    },

    //Pasa a la siguiente actividad
    nextActivity : function() {
        var collection = this.currentActivity.collection;

        //Obtiene la siguiente actividad en el grupo actual
        var nextModel = collection.models[collection.indexOf(this.currentActivity) + 1];

        //Si no hay una siguiente actividad, se pasa al siguiente grupo
        if(nextModel === undefined) {

            for(var i = 1; i < 4; i++){
                var nextGroupIndex = window.collections.activityGroups.indexOf(collection.parent) + i;
                var nextGroup = window.collections.activityGroups.models[nextGroupIndex];
                //Si no hay otro grupo despues del actual
                if(nextGroup === undefined){
                    nextModel = undefined;
                    break;
                }else{
                    nextModel = nextGroup.getCollection().models[0];
                    //Si en el siguiente grupo no hay ninguna actividad se debe continuar, de lo contrario se deja de buscar
                    if(nextModel !== undefined){
                        break;
                        
                    }
                    
                }
            }
        }
        this.currentActivity.set('completed', true);
        //Si de la busqueda anterior no se obtivo ninguna actividad disponible
        if(nextModel === undefined){
            //Echo.leave('workspace.'+this.currentActivity.get('id')+window.teamworkid);
            CSLP.message.warning('No hay mas actividades disponibles, en 5 segundos se te devolvera a la pantalla principal');
            setTimeout(function(){location.replace('/problems')}, 5000);
        }else{
            nextModel.set('locked', false);
            this.changeActivity(nextModel);
        }
        if(this.$('.btn-next-team').is(':visible')){
            $('.btn-next-team').hide();
        }
    },
    renderVote : function() { 
        
    },
    renderActivityInfo : function() {

        //Render Titulo
        $('#activity-title').html(this.currentActivity.get('name'));

        //Agregando la info de los objetivos
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
        this.$('#resources-panel').html(this.currentActivity.get('resource') + txtLista);
//        this.$('#resources-panel').html($('#activity-' + this.currentActivity.get('id') + '-resource').html() + txtLista);

        //Limpiar la consola
        window.consolePanel.clear();

        var toolboxInfo = this.currentActivity.get('toolbox');
        if(toolboxInfo !== undefined) {
            var toolboxType = (toolboxInfo.blocks !== undefined) ? 'blocks' : 'categories';
            window.blocklyPanel.changeToolbox(toolboxInfo.type, toolboxType,toolboxInfo[toolboxType]);
        }else{
            window.blocklyPanel.changeToolbox('all', 'categories');
        }

        window.blocklyPanel.clear();
        //Render intial blockly blocks
        if(this.currentActivity.get('answer'))
            window.blocklyPanel.addInitialBlocks(Blockly.Xml.textToDom(this.currentActivity.get('answer')));

        //Render JS Code
        window.codePanel.updateCode();

        //Envia las reglas al tester
        window.codeTester.setRules(this.currentActivity.get('rules'));

    },

    //Reajusta el tama�o del panel de trabajo en razon del tama�o de la ventana
    resize : function() {
        var height = this.jWindow.height() - this.jFrame.offset().top;

        this.jFrame.height(height);

        window.blocklyPanel.resize();
    },

    //Muestra o esconde el mensaje de loading
    setLoading : function(bool) {
        if(bool) {
            this.$('.loading-container').addClass('active');
        } else {
            this.$('.loading-container').removeClass('active');
        }
    },

    /**
     * EVEMTS
     */

    //Acctivado cuando se clickea algun de los tabs para cambiar de panel
    panelChange : function(event) {
        var tab = $(event.currentTarget);
        if(!tab.hasClass('active')) {
            $('.work-panel').toggleClass('active');
            $('#panel-selector > span').toggleClass('active');

            //Ocultando la barra de herramientas de blockly
            if(tab.attr('data-target') == '#blockly-panel') {
                $('.blocklyToolboxDiv').show();
            } else {
                $('.blocklyToolboxDiv').hide();
                window.codePanel.updateCode();
            }
        }
    },

    //Ejecuta el codigo
    runCode : function(event) {
        window.consolePanel.clear();

        if(this.bySteps) {
            this.disableStepCheck(true);
            window.blocklyPanel.parseCode();
            $('#execution-controls').addClass('running');
        } else {
            window.blocklyPanel.runCode();
        }

        //Quita el focus del btn para que pueda cerrarse el tooltip
        $(event.currentTarget).blur();

    },

    //Bloquea el ajustador de tama�o
    resizerLock : function(event) {
        if(this.isHResizerLocked === false || this.isVResizerLocked === false) {
            this.isHResizerLocked = true;
            this.isVResizerLocked = true;
            this.$el.css('cursor', 'default');
        }
    },

    //Realiza el movimiento del tama�o de los sections, y otorga el nuevo tama�o en porcentages a cada uno
    resizePanel : function(event) {
        //Ajusta el tama�o horizontal de los paneles
        if(this.isHResizerLocked === false) {
            var xPercent = (event.pageX / this.$el.width()).toFixed(4) * 100;

            this.$('.frame-content-right').css('width', (100 - xPercent) + '%');

            //Ajusta el tama�o del panel de blockly en base al nuevo ancho establecido
            //Blockly se ajusta solo cuando se lanza un evento de resize en el window
            window.dispatchEvent(new Event('resize'));

            return false;
        }

        //Ajusta el tama�o vertical de los paneles
        if(this.isVResizerLocked === false) {
            var rightFrame = this.$('.frame-content-right');
            //Obtiene la posicion del cursor relativa al frame derecho
            var yPosition = event.pageY - rightFrame.offset().top;

            yPosition = (yPosition < 0) ? 0 : yPosition;

            //Obtiene el porcentaje relativo
            var yPercent = (yPosition / rightFrame.height()).toFixed(4) * 100;

            yPercent = (yPercent < 6) ? 6 : yPercent;
            yPercent = (yPercent > 94 ) ? 94 : yPercent;

            //Asigna cada porcentaje a los respectivos paneles
            this.$('#resources-panel').css('height', yPercent + '%');
            this.$('#output-panel').css('height', (100 - yPercent) + '%');

            //Posiciona la barra
            this.$('.v-resizer-bar').css('top', yPercent + '%');
        }
    },

    //Libera el ajustador de tama�o horizontal
    hresizerUnlock : function(event) {
        this.isHResizerLocked = false;
        this.$el.css('cursor', 'e-resize');
    },

    //Libera el ajustador de tama�o vertical
    vresizerUnlock : function(event) {
        this.isVResizerLocked = false;
        this.$el.css('cursor', 's-resize');
    },

    //Detiene la ejecucion por pasos
    stopExecution : function(event) {
        window.blocklyPanel.highlightBlock(null);
        //Habilitar checkbox
        this.disableStepCheck(false);
        $('#execution-controls').removeClass('running');
        document.getElementById('btn-step').disabled = 'disabled';

        //Quita el focus del btn para que pueda cerrarse el tooltip
        $(event.currentTarget).blur();
    },

    parseCode : function() {
        window.blocklyPanel.parseCode();
    },

    runStep : function(event) {
        var response = window.blocklyPanel.stepCode();
        //Si la respuesta es falsa significa que ya no quedan mas pasos que realizar
        if(!response) {
            //Habilitar ceckbox
            this.disableStepCheck(false);
            $('#execution-controls').removeClass('running');
            document.getElementById('btn-step').disabled = 'disabled';
        }

        //Quita el focus del btn para que pueda cerrarse el tooltip
        $(event.currentTarget).blur();
    },

    //Activa/Desactiva la opcion de correr el codigo por pasos
    toggleBySteps : function() {
        this.bySteps = (this.bySteps) ? false : true;
        $('#execution-controls').toggleClass('by-step');
    }
});