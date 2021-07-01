CSLP.Workboard.Views.ChatView = Backbone.View.extend({

    events : {
        'click .text-on' : 'showOn',
        'click .btn-send-message': 'newMessage',
        'keyup #chat-message' : 'keyPress',
        'click .btn-emoji' : 'showEmoji',
        'click .btn-answer'  : 'answerTo',
        'click .btn-remove-reply' : 'removeReply'

    },

    modelChat : undefined,

    chat : [],

    user : undefined,

    pivote : 0,

    online : [],

    rMessage : undefined,

    initialize : function() {
        this.user = window.studentUser;
        this.$el = $('#chat-popup');
        $('badge').fadeOut();
        this.$('.chat-user-active').hide();
        this.$('.text-on').html('<div class="content-button-on"><strong >Ver usuarios online</strong><span class="material-icons">expand_more</span></div>');
        if(this.modelChat == undefined)
            this.modelChat = new CSLP.Workboard.Models.Chat();

        this.modelChat.update();
        this.setConection();
        var contandoEmoti = 0;
        document.querySelector('emoji-picker').addEventListener('emoji-click', event => {
            if(this.$el.is(':visible')){
                var mChat = document.querySelector('#chat-message'); 
                console.log(mChat);
                document.querySelector('#chat-message').value += event.detail.unicode;
                contandoEmoti++;
                console.log(contandoEmoti+''+event.detail.unicode);
                console.log(event);
            }    
        });
        
        this.$('#chat-message').click(function(){
            if($('.emoji-popup').is(":visible")){
                $('.emoji-popup').toggle();
            }
        });
        this.$()      
    },
    removeReply : function(){
        this.rMessage = undefined;
        this.$(".r-message-content").hide(500);
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
            this.$('.btn-send-message').click();
        }
    },
    showOn : function(){
        this.$('.chat-user-active').toggle(500);
        if(this.$('.chat-user-active').is(':visible')){
            this.$('.text-on').html('<div class="content-button-on"><strong >Ver usuarios online</strong><span class="material-icons">expand_less</span></div>');
        }else{
            this.$('.text-on').html('<div class="content-button-on"><strong >Ver usuarios online</strong><span class="material-icons">expand_more</span></div>');
        }
    },
    setConection : function(){
        this.$("#chat-message").on('keyup', function(){
            Echo.join('chat-team.'+window.teamworkid)
                .whisper('writing',{user : window.studentUser})
        }).keyup();

        Echo.join('chat-team.'+window.teamworkid)
        .here(user =>{
            this.online.push(user[0]);
            this.renderOnline();
        })

        .joining(user => {
            this.online.push(user);
            this.eventUpdate();

        })

        .leaving(user => {
            this.online = this.online.filter(u => u.id != user.id);
            this.eventUpdate();
            if(window.tempo.get('id') == 0){
                window.tempo.set('seconds', 0);
                window.tempo.set('minutes', 10);
                window.tempo.set('pivotesg', false);
                window.tempo.set('pivotemn', false);
                
                if(window.WB.currentActivity.get('type') == 'Grupal' && $('.wait-group').is(':visible')){
                    window.WB.onChronometer();
                    console.log('crono');
                }
                
            }
        })

        .listen('.message', (e)=>{
            this.chat = this.modelChat.get('messages');
            this.chat.push(e);
            this.modelChat.set('messages',this.chat);
            console.log(e);
            if(e.message.reply_id != null){
                this.$('.content-messages').append('<div id="'+e.message.user_id+this.pivote+'" class="message-interger"></div>');
                if(e.message.reply_user_id == this.user.id){
                    this.$('#'+e.message.user_id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+e.message.user_id+this.pivote+'" class="section-reply"><div id="chat-reply'+e.message.user_id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-reply'+e.message.user_id+this.pivote+'" class="chat-i-message" onclick="viewReply(this)" name="'+e.message.reply_id+'">'+e.message.reply_message+'</div></section></div><div class="message-answer"><section id="section-name-interger'+e.message.id+'" class="section-name-interger"><div id="chat-name-interger'+e.message.id+'" class="chat-name-interger"><strong>'+e.username+'</strong></div><div id="chat-message-interger'+e.message.user_id+this.pivote+'" class="chat-message-interger">'+e.usermessage+'</div><div id="btn-answer'+e.message.user_id+this.pivote+'" name="'+e.message.user_id+':'+e.username+':'+e.usermessage+'" class="btn-answer" onclick="answerTo(this)">⤵️</div></section>');
                }else{
                    this.$('#'+e.message.user_id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+e.message.user_id+this.pivote+'" class="section-reply"><div id="chat-reply'+e.message.user_id+this.pivote+'" class="chat-i-name"><strong>'+e.message.reply_name+'</strong></div><div id="chat-reply'+e.message.user_id+this.pivote+'" class="chat-i-message" onclick="viewReply(this)" name="'+e.message.reply_id+'">'+e.message.reply_message+'</div></section></div><div class="message-answer"><section id="section-name-interger'+e.message.id+'" class="section-name-interger"><div id="chat-name-interger'+e.message.id+'" class="chat-name-interger"><strong>'+e.username+'</strong></div><div id="chat-message-interger'+e.message.user_id+this.pivote+'" class="chat-message-interger">'+e.usermessage+'</div><div id="btn-answer'+e.message.user_id+this.pivote+'" name="'+e.message.user_id+':'+e.username+':'+e.usermessage+'" class="btn-answer" onclick="answerTo(this)">⤵️</div></section>');
                }
            }else{
                this.$('.content-messages').append('<div id="'+e.message.user_id+this.pivote+'" class="message-interger"></div>');
                this.$('#'+e.message.user_id+this.pivote+'').html('<section id="section-name-interger'+e.message.user_id+this.pivote+'" class="section-name-interger"><div id="chat-name-interger'+e.message.user_id+this.pivote+'" class="chat-name-interger"><strong>'+e.username+'</strong></div><div id="chat-message-interger'+e.message.user_id+this.pivote+'" class="chat-message-interger">'+e.usermessage+'</div><div id="btn-answer'+e.message.user_id+this.pivote+'" name="'+e.message.user_id+':'+e.username+':'+e.usermessage+'" class="btn-answer" onclick="answerTo(this)">⤵️</div></section>');
                
            }
            this.pivote++;
            window.WB.newNotification('chat');
            $('#list-unstyled').animate({ scrollTop: $('#p-2').maxheight() }, 2500);
            
        })
        .listenForWhisper('writing', e =>{
                this.$('.text-muted').html(e.user.name+' esta escribiendo...')
            setTimeout(function (){
                this.$('.text-muted').html("");
            },2000)
        
        })
        .listenForWhisper('update', data => {
            this.online = data.arrayOnline;
            this.renderOnline();
            
        })
        .listenForWhisper('updateTeam', data => {
            if(window.WB.currentActivity.get('type') != 'Grupal'){
                this.$('.loading-container-restart').addClass('active');
                window.voteView.modelVote.set('nusers', data);
                window.usercount = data;
                setTimeout(function(){
                    this.$('.loading-container-restart').removeClass('active');
                }, 1000);
                
            }
        })

    },

    eventUpdate : function(){
        Echo.join('chat-team.'+window.WB.currentActivity.get('teamwork'))
            .whisper('update',{arrayOnline : this.online})
        this.renderOnline();
    },

    renderOnline : function(){
        this.$('.intergers-list').html("");
        this.online.forEach(element => {
            this.$('.intergers-list').append('<div id="user-on'+element.id+'" class="content-btn-user"></div>');
            this.$('#user-on'+element.id).html('<div id="btn-user'+element.id+'" class="btn-user" > <span class="material-icons" >person</span><span class="text-hover">'+element.name+'</span></div>');
        })
        
    },
    render : function(){
        this.chat= this.modelChat.get('messages');
        console.log(this.chat);
        if(this.chat != null){
            this.chat.forEach(element =>{
                var userofArray = element.user;
                if(element.reply_id != null){
                    //mensaje de otra persona
                    if(element.user_id != this.user.id){
                        this.$('.content-messages').append('<div id="'+element.user_id+this.pivote+'" class="message-interger"></div>');
                        if(element.reply_user_id == this.user.id){
                            this.$('#'+element.user_id+this.pivote+'').html('<div class="message-reply" ><section id="section-reply'+element.user_id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user_id+this.pivote+'" class="chat-i-name-reply"><strong>Yo</strong></div><div id="chat-reply'+element.id+'" class="chat-i-message-reply" onclick="viewReply(this)" name="'+element.reply_id+'"><span class="message-i-reply">'+element.reply_message+'</span></div></section></div><div class="message-answer"><section id="section-name-interger'+element.user_id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+element.user_id+this.pivote+'"><strong>'+userofArray.name+'</strong></div><div id="chat-message-interger'+element.user_id+this.pivote+'" class="chat-message-interger">'+element.message+'</div><div id="btn-answer'+element.user_id+this.pivote+'" name="'+element.user_id+':'+userofArray.name+':'+element.message+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');
                        }else{
                            this.$('#'+element.user_id+this.pivote+'').html('<div class="message-reply" ><section id="section-reply'+element.user_id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user_id+this.pivote+'" class="chat-i-name-reply"><strong>'+element.reply_name+'</strong></div><div id="chat-reply'+element.id+'" class="chat-i-message-reply" onclick="viewReply(this)" name="'+element.reply_id+'">'+element.reply_message+'</div></section></div><div class="message-answer"><section id="section-name-interger'+element.user_id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+element.user_id+this.pivote+'"><strong>'+userofArray.name+'</strong></div><div id="chat-message-interger'+element.user_id+this.pivote+'" class="chat-message-interger">'+element.message+'</div><div id="btn-answer'+element.user_id+this.pivote+'" name="'+element.user_id+':'+userofArray.name+':'+element.message+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');
                        }
                    }
                    //mi mensaje
                    if(element.user_id == this.user.id){
                        this.$('.content-messages').append('<div id="'+element.user_id+this.pivote+'" class="mymessage"></div>');
                        if(element.reply_user_id == this.user.id){
                            this.$('#'+element.user_id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+element.user_id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user_id+this.pivote+'" class="chat-i-name-reply"><strong>Yo</strong></div><div id="chat-reply'+element.user_id+this.pivote+'" class="chat-i-message-reply" onclick="viewReply(this)" name="'+element.reply_id+'">'+element.reply_message+'</div></section></div><div class="message-answer"><section id="section-i'+element.user_id+this.pivote+'" class="section-i"><div id="chat-i-name'+element.user_id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+element.user_id+this.pivote+'" class="chat-i-message">'+element.message+'</div><div id="btn-answer'+element.user_id+this.pivote+'" class="btn-answer" name="'+element.user_id+':Yo:'+element.message+'" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');
                        }else{
                            this.$('#'+element.user_id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+element.user_id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user_id+this.pivote+'" class="chat-i-name-reply"><strong>'+element.reply_name+'</strong></div><div id="chat-reply'+element.user_id+this.pivote+'" class="chat-i-message-reply" onclick="viewReply(this)" name="'+element.reply_id+'">'+element.reply_message+'</div></section></div><div class="message-answer"><section id="section-i'+element.user_id+this.pivote+'" class="section-i"><div id="chat-i-name'+element.user_id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+element.user_id+this.pivote+'" class="chat-i-message">'+element.message+'</div><div id="btn-answer'+element.user_id+this.pivote+'" class="btn-answer" name="'+element.user_id+':Yo:'+element.message+'" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');
                    
                        }
                        
                    }    
                }else{
                    if(element.user_id != this.user.id){
                        this.$('.content-messages').append('<div id="'+element.user_id+this.pivote+'" class="message-interger"></div>');
                        this.$('#'+element.user_id+this.pivote+'').html('<section id="section-name-interger'+element.user_id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+element.user_id+this.pivote+'"><strong>'+userofArray.name+'</strong></div><div id="chat-message-interger'+element.user_id+this.pivote+'" class="chat-message-interger">'+element.message+'</div><div id="btn-answer'+element.user_id+this.pivote+'" name="'+element.user_id+':'+userofArray.name+':'+element.message+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section>');
                    }
                    if(element.user_id == this.user.id){
                        this.$('.content-messages').append('<div id="'+element.user_id+this.pivote+'" class="mymessage"></div>');
                        this.$('#'+element.user_id+this.pivote+'').html('<section id="section-i'+element.user_id+this.pivote+'" class="section-i"><div id="chat-i-name'+element.user_id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+element.user_id+this.pivote+'" class="chat-i-message">'+element.message+'</div><div id="btn-answer'+element.user_id+this.pivote+'" class="btn-answer" name="'+element.user_id+':Yo:'+element.message+'" title="Responder" onclick="answerTo(this)">⤵️</div></section>');
                    }
                }
                this.pivote++;
            })
        }
    },
    newMessage : function(){
        if(mChat != "" && mChat != " "){
            this.$('.content-messages').append('<div id="'+this.user.id+this.pivote+'" class="mymessage"></div>');
            var mChat = document.getElementById('chat-message').value;
            if(this.rMessage != undefined){
                var message = {user : this.user, message : mChat, rmessage : this.rMessage};
                console.log(this.rMessage);
                this.$('#'+this.user.id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+this.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+this.user.id+this.pivote+'" class="chat-i-name"><strong>'+this.rMessage.username+'</strong></div><div id="chat-reply'+this.user.id+this.pivote+'" class="chat-i-message">'+this.rMessage.message+'</div></section></div><div class="message-answer"><section id="section-i'+this.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+this.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+this.user.id+this.pivote+'" class="chat-i-message">'+mChat+'</div><div id="btn-answer'+this.user.id+this.pivote+'" name="'+this.user.id+':Yo:'+mChat+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');
                this.modelChat.sendMessage(mChat, this.rMessage);
            }else{
                var message = {user : this.user, message : mChat, rmessage : null};
                this.$('#'+this.user.id+this.pivote+'').html('<section id="section-i'+this.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+this.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+this.user.id+this.pivote+'" class="chat-i-message">'+mChat+'</div><div id="btn-answer'+this.user.id+this.pivote+'" name="'+this.user.id+':Yo:'+mChat+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section>');
                this.modelChat.sendMessage(mChat, null);
            }
            this.chat.push(message);
            this.pivote++;
            $('#list-unstyled').animate({ scrollTop: $('#p-2').height() }, 2500);
            document.getElementById('chat-message').value = "";
            this.rMessage = undefined;
            this.$(".r-message-content").hide('slow');
        }else{
            document.getElementById('chat-message').setCustomValidity('Ingrese un mensaje');
        }
        
    },

    show : function() {
        if($('.emoji-popup').is(":visible")){
            $('.emoji-popup').toggle();
        }
        if($('#chat-popup-help').is(":visible")){
            $('#chat-popup-help').hide(500);
            $('.btn-chat-group').hide(500);
            $('.btn-chat-person').hide(500);
        }
        this.$el.toggle(500);
        this.$('badge').toggle(200);
        this.nNewMessage = 0;
        document.getElementById("chat-message").autofocus;
    }

});