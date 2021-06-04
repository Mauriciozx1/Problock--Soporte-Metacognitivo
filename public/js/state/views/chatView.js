CSLP.State.Views.ChatView = Backbone.View.extend({

    events : {
        'click .text-on' : 'showOn',
        'click .btn-send-message': 'newMessage',
        'keyup #chat-message' : 'keyPress',
        'click .btn-emoji' : 'showEmoji',
        'click .btn-answer'  : 'answerTo',
        'click .btn-remove-reply' : 'removeReply',
        'click #menu-person' : 'viewmenu',
    },

    chats : [],

    chat : [],

    user : undefined,

    studentChat : undefined,

    pivote : 0,

    rMessage : undefined,

    idStudentChat : undefined,

    initialize : function() {
        this.user = window.teacher;
        this.$el = $('.chat-popup');
        $('badge').fadeOut();
        if(this.modelChat == undefined)
            this.modelChat = new CSLP.Workboard.Models.Chat();
        document.querySelector('emoji-picker').addEventListener('emoji-click', event => {
            var mChat = document.querySelector('#chat-message'); 
            console.log(mChat);
            document.querySelector('#chat-message').value += event.detail.unicode;
            
        });
        
        this.$('#chat-message').click(function(){
            if($('.emoji-popup').is(":visible")){
                $('.emoji-popup').toggle();
            }
        });
            
    },
    viewmenu : function(){
        console.log('HOLA');
        $('.list-person').toggle('slow');
    },
    setChat : function(student, id){
        if(!$('.text-chat').is(':visible')){
            $('.text-chat').fadeIn();
            $('.no-message').fadeOut();
        }
        if(this.chats.length > 0){
            $('.persons-body-chat').fadeIn();
        }
        
        this.studentChat = student;
        this.idStudentChat = id
        this.render(student);
        if(!$('.chat-popup').is(':visible')){
            this.show();
        }
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
    show : function() {
        if($('.emoji-popup').is(":visible")){
            $('.emoji-popup').toggle();
        }
        this.$el.toggle(500);
        this.$('badge').toggle(200);
        this.nNewMessage = 0;
        document.getElementById("chat-message").autofocus;
    },
    render : function(){
        this.$('.content-messages').html("");
        var pivote = 0;
        var variable = false;
        if(this.chats.length > 0){
            this.chats.forEach(element =>  {
                if(element.student == this.studentChat){
                    this.chat = element.chat;
                    variable = true;
                }
                pivote++;
            });
            console.log(this.chat);
        }if(pivote == this.chat.length && variable == false){
            this.chat = [];
        }
        if(this.chat.length > 0){
            this.chat.forEach(element =>{
                if(element.rmessage != null){
                    //mensaje de otra persona
                    if(element.user.id != this.user.id){
                        this.$('.content-messages').append('<div id="'+element.user_id+this.pivote+'" class="message-interger"></div>');
                        if(element.rmessage.user_id == this.user.id){
                            this.$('#'+element.user.id+this.pivote+'').html('<div class="message-reply" ><section id="section-reply'+element.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user.id+this.pivote+'" class="chat-i-name-reply"><strong>Yo</strong></div><div id="chat-reply'+element.user.id+'" class="chat-i-message-reply" ><span class="message-i-reply">'+element.rmessage.message+'</span></div></section></div><div class="message-answer"><section id="section-name-interger'+element.user.id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+element.user.id+this.pivote+'"><strong>'+element.rmessage.username+'</strong></div><div id="chat-message-interger'+element.user.id+this.pivote+'" class="chat-message-interger">'+element.message+'</div><div id="btn-answer'+element.user.id+this.pivote+'" name="'+element.user.id+':'+element.rmessage.username+':'+element.message+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');
                        }else{
                            this.$('#'+element.user.id+this.pivote+'').html('<div class="message-reply" ><section id="section-reply'+element.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user.id+this.pivote+'" class="chat-i-name-reply"><strong>'+element.rmessage.username+'</strong></div><div id="chat-reply'+element.user.id+'" class="chat-i-message-reply" >'+element.rmessage.message+'</div></section></div><div class="message-answer"><section id="section-name-interger'+element.user.id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+element.user.id+this.pivote+'"><strong>'+element.rmessage.username+'</strong></div><div id="chat-message-interger'+element.user.id+this.pivote+'" class="chat-message-interger">'+element.message+'</div><div id="btn-answer'+element.user.id+this.pivote+'" name="'+element.user.id+':'+element.rmessage.username+':'+element.message+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');
                        }
                    }
                    //mi mensaje
                    if(element.user.id == this.user.id){
                        this.$('.content-messages').append('<div id="'+element.user.id+this.pivote+'" class="mymessage"></div>');
                        if(element.rmessage.user_id == this.user.id){
                            this.$('#'+element.user.id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+element.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user.id+this.pivote+'" class="chat-i-name-reply"><strong>Yo</strong></div><div id="chat-reply'+element.user.id+this.pivote+'" class="chat-i-message-reply" >'+element.rmessage.message+'</div></section></div><div class="message-answer"><section id="section-i'+element.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+element.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+element.user.id+this.pivote+'" class="chat-i-message">'+element.message+'</div><div id="btn-answer'+element.user.id+this.pivote+'" class="btn-answer" name="'+element.user_id+':'+this.user.name+' '+this.user.flastname+':'+element.message+'" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');
                        }else{
                            this.$('#'+element.user.id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+element.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user.id+this.pivote+'" class="chat-i-name-reply"><strong>'+element.rmessage.username+'</strong></div><div id="chat-reply'+element.user.id+this.pivote+'" class="chat-i-message-reply">'+element.rmessage.message+'</div></section></div><div class="message-answer"><section id="section-i'+element.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+element.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+element.user.id+this.pivote+'" class="chat-i-message">'+element.message+'</div><div id="btn-answer'+element.user.id+this.pivote+'" class="btn-answer" name="'+element.user_id+':'+this.user.name+' '+this.user.flastname+':'+element.message+'" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');
                    
                        }
                        
                    }    
                }else{
                    if(element.user.id != this.user.id){
                        this.$('.content-messages').append('<div id="'+element.user.id+this.pivote+'" class="message-interger"></div>');
                        this.$('#'+element.user_id+this.pivote+'').html('<section id="section-name-interger'+element.user.id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+element.user.id+this.pivote+'"><strong>'+element.user.name+' '+element.user.flastname+'</strong></div><div id="chat-message-interger'+element.user.id+this.pivote+'" class="chat-message-interger">'+element.message+'</div><div id="btn-answer'+element.user.id+this.pivote+'" name="'+element.user_id+':'+userofArray.name+':'+element.message+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section>');
                    }
                    if(element.user.id == this.user.id){
                        this.$('.content-messages').append('<div id="'+element.user.id+this.pivote+'" class="mymessage"></div>');
                        this.$('#'+element.user.id+this.pivote+'').html('<section id="section-i'+element.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+element.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+element.user.id+this.pivote+'" class="chat-i-message">'+element.message+'</div><div id="btn-answer'+element.user.id+this.pivote+'" class="btn-answer" name="'+element.user.id+':'+this.user.name+' '+this.user.flastname+':'+element.message+'" title="Responder" onclick="answerTo(this)">⤵️</div></section>');
                    }
                }
                this.pivote++;
            })
        }

    },
    newMessageStudent(data){
        var student = data.name;
        var pivote = 0;
        var variable = false;
        var chat = data.data;
        var index = null
        var array = [];
        if(this.chats.length > 0){
            console.log(this.chats);
            index = this.chats.findIndex(element => element.student == student);
            
            if(index != null){
                console.log(this.chats[index]);
                this.chats[index].chat.push(chat);
            }
            
            if(index == null){
                array.push(chat);
                this.chats.push({student: student, chat: array});
            }
        }if(this.chats.length == 0){
            array.push(chat);
            this.chats.push({student: student, chat: array});
        }
        this.$('.content-messages').append('<div id="'+chat.user.id+this.pivote+'" class="message-interger"></div>');
        if(chat.rmessage == null){
            this.$('#'+chat.user.id+this.pivote+'').html('<section id="section-name-interger'+chat.user.id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+chat.user.id+this.pivote+'"><strong>'+student+'</strong></div><div id="chat-message-interger'+chat.user.id+this.pivote+'" class="chat-message-interger">'+chat.message+'</div><div id="btn-answer'+chat.user.id+this.pivote+'" name="'+chat.user.id+':'+student+':'+chat.message+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section>');
        }
        if(chat.rmessage != null){
            var name = chat.rmessage.username;
            if(chat.rmessage.user_id == this.user.id){
                name = 'Yo';
            }
            this.$('#'+chat.user.id+this.pivote+'').html('<div class="message-reply" ><section id="section-reply'+chat.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+chat.user.id+this.pivote+'" class="chat-i-name-reply"><strong>'+name+'</strong></div><div id="chat-reply'+chat.user.id+'" class="chat-i-message-reply"  >'+chat.rmessage.message+'</div></section></div><div class="message-answer"><section id="section-name-interger'+chat.user.id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+chat.user.id+this.pivote+'"><strong>'+chat.user.name+' '+chat.user.flastname+'</strong></div><div id="chat-message-interger'+chat.user.id+this.pivote+'" class="chat-message-interger">'+chat.message+'</div><div id="btn-answer'+chat.user.id+this.pivote+'" name="'+chat.user.id+':'+chat.user.name+' '+chat.user.flastname+':'+chat.message+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');    
        }

        this.pivote++;
        $('#list-unstyled').animate({ scrollTop: $('.p-2').height() }, 2500);
        console.log(this.chats);
    
    },
    newMessage : function(){
        var mChat = document.getElementById('chat-message').value;
        console.log(mChat);
        if(mChat != "" && mChat != " "){
            this.$('.content-messages').append('<div id="'+this.user.id+this.pivote+'" class="mymessage"></div>');
            if(this.rMessage != undefined){
                var message = {user : this.user, message : mChat, rmessage : this.rMessage};
                console.log(this.rMessage);
                this.$('#'+this.user.id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+this.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+this.user.id+this.pivote+'" class="chat-i-name"><strong>'+this.rMessage.username+'</strong></div><div id="chat-reply'+this.user.id+this.pivote+'" class="chat-i-message">'+this.rMessage.message+'</div></section></div><div class="message-answer"><section id="section-i'+this.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+this.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+this.user.id+this.pivote+'" class="chat-i-message">'+mChat+'</div><div id="btn-answer'+this.user.id+this.pivote+'" name="'+this.user.id+':'+this.user.name+' '+this.user.flastname+':'+mChat+'" class="btn-answer" title="Responder">⤵️</div></section></div>');
                //this.modelChat.sendMessage(this.studentChat ,message);
            }else{
                var message = {user : this.user, message : mChat, rmessage : null};
                this.$('#'+this.user.id+this.pivote+'').html('<section id="section-i'+this.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+this.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+this.user.id+this.pivote+'" class="chat-i-message">'+mChat+'</div><div id="btn-answer'+this.user.id+this.pivote+'" name="'+this.user.id+':'+this.user.name+' '+this.user.flastname+':'+mChat+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section>');
                //this.modelChat.sendMessage(this.studentChat, message);
            }
            this.addChat(message);
            this.pivote++;
            $('#list-unstyled').animate({ scrollTop: $('.p-2').height() }, 2500);
            document.getElementById('chat-message').value = "";
            this.rMessage = undefined;
            this.$(".r-message-content").hide('slow');
            this.sendMessage(message);
        }else{
            document.getElementById('chat-message').setCustomValidity('Ingrese un mensaje');
        }
    },
    sendMessage : function(message){
        Echo.join('status.'+window.idProblem)
        .whisper('messageHelp',{id :  this.idStudentChat ,message : message})
    },
    addChat : function(message){
        var array = [];
        if(this.chats.length > 0){
            var chat = null;
            
            chat = this.chats.findIndex(element => element.student == this.studentChat);
            console.log(chat);
            if(chat != null){
                console.log(this.chats[chat]);
                this.chats[chat].chat.push(message);
                
            }
            
            if(chat == null){
                array.push(message);
                this.chats.push({student: this.studentChat, chat: array});
            }
            
        }if(this.chats.length == 0){
            array.push(message);
            this.chats.push({student: this.studentChat, chat: array});
        }
        console.log(this.chats);
    }
});