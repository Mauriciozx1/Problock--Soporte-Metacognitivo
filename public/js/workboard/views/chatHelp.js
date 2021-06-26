CSLP.Workboard.Views.ChatHelp = Backbone.View.extend({

    events : {
        'click .text-on' : 'showOn',
        'click #btn-send-message': 'newMessage',
        'click #btn-send-message-help': 'newMessage',
        'keyup #chat-message' : 'keyPress',
        'keyup #chat-message-help' : 'keyPress',
        'click .btn-emoji' : 'showEmoji',
        'click .btn-answer'  : 'answerTo',
        'click .btn-capture'  : 'capture',
        'click .btn-delete-capture'  : 'deleteCapture',
        'click .btn-remove-reply' : 'removeReply',
        'click .capture-img' : 'zoomCapture',
        'click #btn-chat-person'  : 'setChatPerson',
        'click #btn-chat-group'  : 'setChatGroup',
        
    },
    chatGroup :[],

    chat : [],

    chatType : undefined,

    user : undefined,

    studentChat : undefined,

    pivote : 0,

    rMessage : undefined,
    
    message : undefined,

    pivoteIMG : 0, 

    imgs : [],

    teamworkid : null,

    notificationPerson : 0,

    notificationGroup : 0,

    notificationHelp : 0,

    initialize : function() {
        $('#badge-chat-help').hide();
        $('#badge-chat-person').hide();
        $('#badge-chat-group').hide();
        this.user = window.user;
        
        console.log(this.teamworkid);
        this.$el = $('#chat-popup-help');
        document.querySelector('emoji-picker').addEventListener('emoji-click', event => {
            if(this.chatType == true && this.$el.is(':visible')){
                var mChat = document.querySelector('#chat-message-help'); 
                document.querySelector('#chat-message-help').value += event.detail.unicode;
                console.log(mChat);
            }else{
                if(this.$el.is(':visible')){
                    var mChat = document.querySelector('#chat-message'); 
                    document.querySelector('#chat-message').value += event.detail.unicode;
                    console.log(mChat);
                }
                
            }
            
        });
        
        this.$('#chat-message').click(function(){
            if($('.emoji-popup').is(":visible")){
                $('.emoji-popup').toggle();
            }
        });
        this.$('#chat-message-help').click(function(){
            if($('.emoji-popup').is(":visible")){
                $('.emoji-popup').toggle();
            }
        });
            
    },
    newNotification : function(type){
        if(type == 'help'){
            this.notificationHelp++;
            if(!this.$el.is(':visible')){
                $('#badge-chat-help').html(''+this.notificationHelp+'').show(400);
            }
        }
        if(type == 'person'){
            this.notificationPerson++;
            $('#badge-chat-person').html(''+this.notificationPerson+'').show(400)
        }
        if(type == 'group'){
            this.notificationGroup++;
            $('#badge-chat-group').html(''+this.notificationGroup+'').show(400);
        }
        console.log(type);
        console.log(this.notificationHelp);
        console.log(this.notificationPerson);
        console.log(this.notificationGroup);
    },
    zoomCapture : function(event){
        var tab = $(event.currentTarget);
        var imgData = tab.attr('src');
        $('#view-img-screen').attr('src',imgData);
        $('.modal-screen-zoom').fadeIn('slow');
    },
    capture : function(){
        var img = null;
        html2canvas(document.querySelector("#blockly-panel")).then(
            canvas =>{
                img = canvas.toDataURL();
                console.log(img);
                //var data = {id : window.studentUser.id, name : window.studentUser.name+' '+window.studentUser.flastname, img : img};
                CSLP.message.success('Se ha tomado una captura correctamente.');
                this.imgs.push(img);
                this.$(".view-capture").append('<div class="capture" id="capture-'+this.pivoteIMG+'"><div class="button-option-capture"><button class="btn-delete-capture" name="'+this.pivoteIMG+'" title="Eliminar">x</button></div><img title="Ver" class="capture-img" src="'+img+'" alt=""></div>').show('slow');
            })
        this.pivoteIMG++;
        
    },
    deleteCapture : function(event){
        var tab = $(event.currentTarget);
        var id = tab.attr('name');
        this.$('#capture-'+id).hide('slow');
        this.imgs.splice(id, 1);
    },
    
    
    removeReply : function(){
        this.rMessage = undefined;
        this.$("#r-message-content-help").hide(500);
    },
    setrMessage : function(message){
        this.rMessage = message;
        console.log(message);
        //this.rMessage = this.$()
    },
    showEmoji : function(){
        $('.emoji-popup').toggle();
    },
    keyPress : function(event){
        if(event.keyCode == 13){
            this.newMessage();
        }
    },
    setChatPerson : function(){
        this.notificationPerson = 0;
        $('#badge-chat-person').hide(400);
        var chat = [];
        if(!$('.text-chat').is(':visible')){
            $('.text-chat').fadeIn(400);
            $('.no-message').fadeOut(400);
        }
        
        if(this.chatGroup.length > 0){
            console.log(this.chatGroup);
            index = this.chatGroup.findIndex(element => element.student == this.user.name+' '+this.user.flastname);
            if(index >= 0){
                chat = this.chatGroup[index].chat;
            }
        }
        this.studentChat = this.user.name+' '+this.user.flastname;
        this.$('#title-chat-help').html('<strong>Comunícate con el Profesor</strong><span id="btn-capture" class="btn-capture" title="Tomar Captura">📷️</span><p>Chat privado con Profesor</p>');
        this.chatType = true;
        this.teamworkid = null;
        console.log(this.teamworkid);
        this.render(chat);
    },
    setChatGroup : function(){
        this.notificationGroup = 0;
        $('#badge-chat-group').hide(400);
        var chat = [];
        if(!$('.text-chat').is(':visible')){
            $('.text-chat').fadeIn(400);
            $('.no-message').fadeOut(400);
        }
        if(this.chatGroup.length > 0){
            console.log(this.chatGroup);
            index = this.chatGroup.findIndex(element => element.student == window.teamworks.Tname);
            if(index >= 0){
                chat = this.chatGroup[index].chat;
            }  
        }
        this.studentChat = window.teamworks.Tname;
        this.$('#title-chat-help').html('<strong>Comunícate con el Profesor</strong><span id="btn-capture" class="btn-capture" title="Tomar Captura">📷️</span><p>Chat con Integrantes y Profesor</p>');
        this.chatType = true;
        this.teamworkid = window.teamworkid;
        console.log(this.teamworkid);
        this.render(chat);
    },
    
    show : function() {
        if($('.emoji-popup').is(":visible")){
            $('.emoji-popup').toggle();
        }
        if($('#chat-popup').is(":visible")){
            $('#chat-popup').fadeOut(500);
        }
        $('.btn-chat-group').show(500);
        $('.btn-chat-person').show(500);
        
        this.$el.toggle(500);
        this.notificationHelp = 0;
        $('#badge-chat-help').hide(400);
        this.nNewMessage = 0;
        document.getElementById("chat-message").autofocus;
    },
    render : function(chat){
        this.$('.content-messages-help').html("");
        console.log(chat);
        if(chat.length > 0){
            console.log(chat)
            chat.forEach(element =>{
                if(element.rmessage != null){
                    //mensaje de otra persona
                    if(element.user.id != this.user.id){
                        this.$('.content-messages-help').append('<div id="'+element.user.id+this.pivote+'" class="message-interger"></div>');
                        if(element.rmessage.user_id == this.user.id){
                            this.$('#'+element.user.id+this.pivote+'').html('<div class="message-reply" ><section id="section-reply'+element.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user.id+this.pivote+'" class="chat-i-name-reply"><strong>Yo</strong></div><div id="chat-reply'+element.user.id+'" class="chat-i-message-reply" ><span class="message-i-reply">'+element.rmessage.message+'</span></div></section></div><div class="message-answer"><section id="section-name-interger'+element.user.id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+element.user.id+this.pivote+'"><strong>'+element.rmessage.username+'</strong></div><div id="chat-message-interger'+element.user.id+this.pivote+'" class="chat-message-interger">'+element.message+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+element.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+element.user.id+this.pivote+'" name="'+element.user.id+':'+element.rmessage.username+':'+element.message+'" class="btn-answer" title="Responder" onclick="answerToHelp(this)">⤵️</div></section></div>');
                        }else{
                            this.$('#'+element.user.id+this.pivote+'').html('<div class="message-reply" ><section id="section-reply'+element.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user.id+this.pivote+'" class="chat-i-name-reply"><strong>'+element.rmessage.username+'</strong></div><div id="chat-reply'+element.user.id+'" class="chat-i-message-reply" >'+element.rmessage.message+'</div></section></div><div class="message-answer"><section id="section-name-interger'+element.user.id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+element.user.id+this.pivote+'"><strong>'+element.rmessage.username+'</strong></div><div id="chat-message-interger'+element.user.id+this.pivote+'" class="chat-message-interger">'+element.message+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+element.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+element.user.id+this.pivote+'" name="'+element.user.id+':'+element.rmessage.username+':'+element.message+'" class="btn-answer" title="Responder" onclick="answerToHelp(this)">⤵️</div></section></div>');
                        }
                    }
                    //mi mensaje
                    if(element.user.id == this.user.id){
                        this.$('.content-messages-help').append('<div id="'+element.user.id+this.pivote+'" class="mymessage"></div>');
                        if(element.rmessage.user_id == this.user.id){
                            this.$('#'+element.user.id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+element.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user.id+this.pivote+'" class="chat-i-name-reply"><strong>Yo</strong></div><div id="chat-reply'+element.user.id+this.pivote+'" class="chat-i-message-reply" >'+element.rmessage.message+'</div></section></div><div class="message-answer"><section id="section-i'+element.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+element.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+element.user.id+this.pivote+'" class="chat-i-message">'+element.message+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+element.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+element.user.id+this.pivote+'" class="btn-answer" name="'+element.user_id+':'+this.user.name+' '+this.user.flastname+':'+element.message+'" title="Responder" onclick="answerToHelp(this)">⤵️</div></section></div>');
                        }else{
                            this.$('#'+element.user.id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+element.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user.id+this.pivote+'" class="chat-i-name-reply"><strong>'+element.rmessage.username+'</strong></div><div id="chat-reply'+element.user.id+this.pivote+'" class="chat-i-message-reply">'+element.rmessage.message+'</div></section></div><div class="message-answer"><section id="section-i'+element.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+element.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+element.user.id+this.pivote+'" class="chat-i-message">'+element.message+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+element.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+element.user.id+this.pivote+'" class="btn-answer" name="'+element.user_id+':'+this.user.name+' '+this.user.flastname+':'+element.message+'" title="Responder" onclick="answerToHelp(this)">⤵️</div></section></div>');
                    
                        }
                        
                    }    
                }else{
                    if(element.user.id != this.user.id){
                        this.$('.content-messages-help').append('<div id="'+element.user.id+this.pivote+'" class="message-interger"></div>');
                        this.$('#'+element.user.id+this.pivote+'').html('<section id="section-name-interger'+element.user.id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+element.user.id+this.pivote+'"><strong>'+element.user.name+' '+element.user.flastname+'</strong></div><div id="chat-message-interger'+element.user.id+this.pivote+'" class="chat-message-interger">'+element.message+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+element.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+element.user.id+this.pivote+'" name="'+element.user.id+':'+element.user.name+' '+element.user.flastname+':'+element.message+'" class="btn-answer" title="Responder" onclick="answerToHelp(this)">⤵️</div></section>');
                    }
                    if(element.user.id == this.user.id){
                        this.$('.content-messages-help').append('<div id="'+element.user.id+this.pivote+'" class="mymessage"></div>');
                        this.$('#'+element.user.id+this.pivote+'').html('<section id="section-i'+element.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+element.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+element.user.id+this.pivote+'" class="chat-i-message">'+element.message+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+element.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+element.user.id+this.pivote+'" class="btn-answer" name="'+element.user.id+':'+this.user.name+' '+this.user.flastname+':'+element.message+'" title="Responder" onclick="answerToHelp(this)">⤵️</div></section>');
                    }
                }
                if(element.imgs.length > 0){
                    var id = element.user.id+''+this.pivote;
                    element.imgs.forEach(element => {
                        this.$('#view-capture-chat-'+id).append('<div class="capture"><div class="button-option-capture"></div><img title="Ver" class="capture-img" src="'+element+'" alt=""></div>');
                    });
                }
                this.pivote++;

            })
            $('#list-unstyled-help').animate({ scrollTop: $('#p-2-help').height() }, 2500);
        }

    },
    newMessageTeam : function(data){
        if(this.studentChat == data.student){
            this.message = data;
            this.newMessage();
        }else{
            this.addMessage(data.student, data.message);
        }
    },
    addMessage : function(name, message){
        var array = [];
        if(this.chatGroup.length > 0){
            var index = null;
            index = this.chatGroup.findIndex(element => element.student == name);
            console.log(index);
            if(index != null && index != -1){
                console.log(this.chatGroup[index]);
                this.chatGroup[index].chat.push(message);
                
            }
            
            if(index == null || index < 0){
                array.push(message);
                this.chatGroup.push({student: name, chat: array});
            }
            
        }
        if(this.chatGroup.length == 0){
            array.push(message);
            this.chatGroup.push({student: name, chat: array});
        }
        console.log(this.chatGroup);
    },

    newMessage : function(){
        var message = this.message;
        var mChat = document.getElementById('chat-message').value;
        if(this.chatType == true){
            mChat = document.getElementById('chat-message-help').value;
        }
        console.log(mChat);
        console.log(message);
        var messageData = null;
        if(message != undefined){
            messageData = message.message;
            if(!this.$el.is(':visible')){
                this.$('#badge-chat-help').hide(400);
            }
        }
        if(mChat != "" && mChat != " " && message == undefined || message == undefined && this.imgs.length > 0){
            if(this.chatType == true){
                this.$('.content-messages-help').append('<div id="'+this.user.id+this.pivote+'" class="mymessage"></div>');
            }else{
                this.$('.content-messages').append('<div id="'+this.user.id+this.pivote+'" class="mymessage"></div>');
            
            }
            if(this.rMessage != undefined){
                messageData = {user : this.user, message : mChat, rmessage : this.rMessage, imgs: this.imgs};
                console.log(this.rMessage);
                var username = this.rMessage.username;
                if(this.rMessage.user_id == this.user.id){ 
                    username = 'Yo'
                }
                this.$('#'+this.user.id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+this.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+this.user.id+this.pivote+'" class="chat-i-name"><strong>'+username+'</strong></div><div id="chat-reply'+this.user.id+this.pivote+'" class="chat-i-message">'+this.rMessage.message+'</div></section></div><div class="message-answer"><section id="section-i'+this.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+this.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+this.user.id+this.pivote+'" class="chat-i-message">'+mChat+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+this.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+this.user.id+this.pivote+'" name="'+this.user.id+':'+this.user.name+' '+this.user.flastname+':'+mChat+'" class="btn-answer" title="Responder" onclick="answerToHelp(this)">⤵️</div></section></div>');
                
                //this.modelChat.sendMessage(this.studentChat ,message);
            }else{
                if(message == undefined){
                    messageData = {user : this.user, message : mChat, rmessage : null, imgs: this.imgs};
                    this.$('#'+this.user.id+this.pivote+'').html('<section id="section-i'+this.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+this.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+this.user.id+this.pivote+'" class="chat-i-message">'+mChat+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+this.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+this.user.id+this.pivote+'" name="'+this.user.id+':'+this.user.name+' '+this.user.flastname+':'+mChat+'" class="btn-answer" title="Responder" onclick="answerToHelp(this)">⤵️</div></section>');
                }
                //this.modelChat.sendMessage(this.studentChat, message);
            }
            this.setImages(this.imgs, this.user.id+''+this.pivote);
            if(this.chatType == undefined){
                this.chat.push(messageData);
                document.getElementById('chat-message').value = "";
                $('#list-unstyled').animate({ scrollTop: $('.p-2').height() }, 2500);
                this.$(".r-message-content").hide('slow');
            }
            if(this.chatType == true){
                this.addMessage(this.studentChat, messageData);
                document.getElementById('chat-message-help').value = "";
                $('#list-unstyled-help').animate({ scrollTop: $('#p-2-help').height() }, 2500);
                this.$("#r-message-content-help").hide('slow');
            }
            this.pivote++;
            this.rMessage = undefined;
            this.imgs = [];
            if(message == undefined){
                this.sendMessage(messageData);
            }
        }else{
            if(message == undefined && this.chatType == undefined){
                document.getElementById('chat-message').setCustomValidity('Ingrese un mensaje');
            }else{
                var name = messageData.user.name + ' ' + messageData.user.flastname;
                if(this.chatType){
                    this.$('.content-messages-help').append('<div id="'+messageData.user.id+this.pivote+'" class="message-interger"></div>');
                
                }else{
                    this.$('.content-messages').append('<div id="'+messageData.user.id+this.pivote+'" class="message-interger"></div>');
                
                }
                if(!message.message.rmessage){
                    this.$('#'+messageData.user.id+this.pivote+'').html('<section id="section-name-interger'+messageData.user.id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+messageData.user.id+this.pivote+'"><strong>'+name+'</strong></div><div id="chat-message-interger'+messageData.user.id+this.pivote+'" class="chat-message-interger">'+messageData.message+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+messageData.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+messageData.user.id+this.pivote+'" name="'+messageData.user.id+':'+name+':'+messageData.message+'" class="btn-answer" title="Responder" onclick="answerToHelp(this)">⤵️</div></section>');
                }else{
                    if(message.message.rmessage.user_id == this.user.id){
                        name = 'Yo';
                    }
                    this.$('#'+messageData.user.id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+messageData.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+messageData.user.id+this.pivote+'" class="chat-i-name"><strong>'+name+'</strong></div><div id="chat-reply'+messageData.user.id+this.pivote+'" class="chat-i-message">'+messageData.rmessage.message+'</div></section></div><div class="message-answer"><section id="section-i'+messageData.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+messageData.user.id+this.pivote+'" class="chat-i-name"><strong>'+messageData.user.name +' '+messageData.user.flastname+'</strong></div><div id="chat-i-message'+messageData.user.id+this.pivote+'" class="chat-i-message">'+messageData.message+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+messageData.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+messageData.user.id+this.pivote+'" name="'+messageData.user.id+':'+messageData.user.name +' '+messageData.user.flastname+':'+messageData.message+'" class="btn-answer" title="Responder" onclick="answerToHelp(this)">⤵️</div></section></div>');     
                
                    }
                    if(this.chatType == undefined){
                        this.chat.push(messageData);
                    }else{
                        this.addMessage(this.studentChat, messageData);
                    }
                this.setImages(messageData.imgs, messageData.user.id+''+this.pivote);
                this.pivote++;
                $('#list-unstyled').animate({ scrollTop: $('.p-2').height() }, 2500);
            }
        }
        
        this.message = undefined;
    },
    setImages : function(imgs, id){
        console.log(imgs);
        console.log(id);
        if(imgs.length > 0){
            imgs.forEach(element => {
                this.$('#view-capture-chat-'+id).append('<div class="capture"><div class="button-option-capture"></div><img title="Ver" class="capture-img" src="'+element+'" alt=""></div>');
            });
        }
        
        this.$(".view-capture").html("").fadeOut('slow');
        this.pivoteIMG = 0;

    },
    sendMessage : function(message){
        var student = this.user.name +' '+this.user.flastname;;
        if(this.chatType == true){
            student = this.studentChat;
        }
        console.log({student : student ,data : message, idTeam : this.teamworkid});
        Echo.join('status.'+window.problemid)
        .whisper('messageHelpforTeacher',{student : student, data : message, idTeam : this.teamworkid})
    },
    
});