CSLP.Workboard.Views.ChatHelp = Backbone.View.extend({

    events : {
        'click .text-on' : 'showOn',
        'click .btn-send-message': 'newMessage',
        'keyup #chat-message' : 'keyPress',
        'click .btn-emoji' : 'showEmoji',
        'click .btn-answer'  : 'answerTo',
        'click .btn-capture'  : 'capture',
        'click .btn-delete-capture'  : 'deleteCapture',
        'click .btn-remove-reply' : 'removeReply',
        'click #menu-person' : 'viewmenu',
        'click .capture-img' : 'zoomCapture'
        
    },

    chat : [],

    user : undefined,

    studentChat : undefined,

    pivote : 0,

    rMessage : undefined,
    
    message : undefined,

    pivoteIMG : 0, 

    imgs : [],

    initialize : function() {
        this.user = window.user;
        this.$el = $('#chat-popup-help');
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
    viewmenu : function(){
        console.log('HOLA');
        $('.list-person').toggle('slow');
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
    /*render : function(student){
        this.$('.content-messages').html("");
        var pivote = 0;
        var variable = false;
        this.chats.forEach(element =>  {
            if(element.student == this.studentChat){
                this.chat = element.chat;
                variable = true;
            }
            pivote++;
        });
        console.log(this.chat);
        if(this.chat.length > 0){
            if(this.chats.length == pivote && variable == false){
                this.chat = [];
            }
            this.chat.forEach(element =>{
                var userofArray = element.user;
                if(element.reply_id != null){
                    //mensaje de otra persona
                    if(element.user.id != this.user.id){
                        this.$('.content-messages').append('<div id="'+element.user_id+this.pivote+'" class="message-interger"></div>');
                        if(element.reply_user_id == this.user.id){
                            this.$('#'+element.user_id+this.pivote+'').html('<div class="message-reply" ><section id="section-reply'+element.user_id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user_id+this.pivote+'" class="chat-i-name-reply"><strong>Yo</strong></div><div id="chat-reply'+element.id+'" class="chat-i-message-reply" onclick="viewReply(this)" name="'+element.reply_id+'"><span class="message-i-reply">'+element.reply_message+'</span></div></section></div><div class="message-answer"><section id="section-name-interger'+element.user_id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+element.user_id+this.pivote+'"><strong>'+userofArray.name+'</strong></div><div id="chat-message-interger'+element.user_id+this.pivote+'" class="chat-message-interger">'+element.message+'</div><div id="btn-answer'+element.user_id+this.pivote+'" name="'+element.user_id+':'+userofArray.name+':'+element.message+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');
                        }else{
                            this.$('#'+element.user_id+this.pivote+'').html('<div class="message-reply" ><section id="section-reply'+element.user_id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user_id+this.pivote+'" class="chat-i-name-reply"><strong>'+element.reply_name+'</strong></div><div id="chat-reply'+element.id+'" class="chat-i-message-reply" onclick="viewReply(this)" name="'+element.reply_id+'">'+element.reply_message+'</div></section></div><div class="message-answer"><section id="section-name-interger'+element.user_id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+element.user_id+this.pivote+'"><strong>'+userofArray.name+'</strong></div><div id="chat-message-interger'+element.user_id+this.pivote+'" class="chat-message-interger">'+element.message+'</div><div id="btn-answer'+element.user_id+this.pivote+'" name="'+element.user_id+':'+userofArray.name+':'+element.message+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');
                        }
                    }
                    //mi mensaje
                    if(element.user.id == this.user.id){
                        this.$('.content-messages').append('<div id="'+element.user_id+this.pivote+'" class="mymessage"></div>');
                        if(element.reply_user_id == this.user.id){
                            this.$('#'+element.user_id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+element.user_id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user_id+this.pivote+'" class="chat-i-name-reply"><strong>Yo</strong></div><div id="chat-reply'+element.user_id+this.pivote+'" class="chat-i-message-reply" onclick="viewReply(this)" name="'+element.reply_id+'">'+element.reply_message+'</div></section></div><div class="message-answer"><section id="section-i'+element.user_id+this.pivote+'" class="section-i"><div id="chat-i-name'+element.user_id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+element.user_id+this.pivote+'" class="chat-i-message">'+element.message+'</div><div id="btn-answer'+element.user_id+this.pivote+'" class="btn-answer" name="'+element.user_id+':Yo:'+element.message+'" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');
                        }else{
                            this.$('#'+element.user_id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+element.user_id+this.pivote+'" class="section-reply"><div id="chat-reply'+element.user_id+this.pivote+'" class="chat-i-name-reply"><strong>'+element.reply_name+'</strong></div><div id="chat-reply'+element.user_id+this.pivote+'" class="chat-i-message-reply" onclick="viewReply(this)" name="'+element.reply_id+'">'+element.reply_message+'</div></section></div><div class="message-answer"><section id="section-i'+element.user_id+this.pivote+'" class="section-i"><div id="chat-i-name'+element.user_id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+element.user_id+this.pivote+'" class="chat-i-message">'+element.message+'</div><div id="btn-answer'+element.user_id+this.pivote+'" class="btn-answer" name="'+element.user_id+':Yo:'+element.message+'" title="Responder" onclick="answerTo(this)">⤵️</div></section></div>');
                    
                        }
                        
                    }    
                }else{
                    if(element.user.id != this.user.id){
                        this.$('.content-messages').append('<div id="'+element.user_id+this.pivote+'" class="message-interger"></div>');
                        this.$('#'+element.user_id+this.pivote+'').html('<section id="section-name-interger'+element.user_id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+element.user_id+this.pivote+'"><strong>'+userofArray.name+'</strong></div><div id="chat-message-interger'+element.user_id+this.pivote+'" class="chat-message-interger">'+element.message+'</div><div id="btn-answer'+element.user_id+this.pivote+'" name="'+element.user_id+':'+userofArray.name+':'+element.message+'" class="btn-answer" title="Responder" onclick="answerTo(this)">⤵️</div></section>');
                    }
                    if(element.user.id == this.user.id){
                        this.$('.content-messages').append('<div id="'+element.user_id+this.pivote+'" class="mymessage"></div>');
                        this.$('#'+element.user_id+this.pivote+'').html('<section id="section-i'+element.user_id+this.pivote+'" class="section-i"><div id="chat-i-name'+element.user_id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+element.user_id+this.pivote+'" class="chat-i-message">'+element.message+'</div><div id="btn-answer'+element.user_id+this.pivote+'" class="btn-answer" name="'+element.user_id+':Yo:'+element.message+'" title="Responder" onclick="answerToHelp(this)">⤵️</div></section>');
                    }
                }
                this.pivote++;
            })
        }

    },*/
    newMessage : function(){
        var message = this.message;
        var mChat = document.getElementById('chat-message').value;
        console.log(mChat);
        console.log(message);
        var messageData = null;
        if(message != undefined){
            messageData = message.message;
        }
        if(mChat != "" && mChat != " " && message == undefined){
            this.$('.content-messages').append('<div id="'+this.user.id+this.pivote+'" class="mymessage"></div>');
            if(this.rMessage != undefined){
                messageData = {user : this.user, message : mChat, rmessage : this.rMessage, imgs: this.imgs};
                console.log(this.rMessage);
                this.$('#'+this.user.id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+this.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+this.user.id+this.pivote+'" class="chat-i-name"><strong>'+this.rMessage.username+'</strong></div><div id="chat-reply'+this.user.id+this.pivote+'" class="chat-i-message">'+this.rMessage.message+'</div></section></div><div class="message-answer"><section id="section-i'+this.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+this.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+this.user.id+this.pivote+'" class="chat-i-message">'+mChat+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+this.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+this.user.id+this.pivote+'" name="'+this.user.id+':'+this.user.name+' '+this.user.flastname+':'+mChat+'" class="btn-answer" title="Responder" onclick="answerToHelp(this)">⤵️</div></section></div>');
                
                //this.modelChat.sendMessage(this.studentChat ,message);
            }else{
                if(message == undefined){
                    messageData = {user : this.user, message : mChat, rmessage : null, imgs: this.imgs};
                    this.$('#'+this.user.id+this.pivote+'').html('<section id="section-i'+this.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+this.user.id+this.pivote+'" class="chat-i-name"><strong>Yo</strong></div><div id="chat-i-message'+this.user.id+this.pivote+'" class="chat-i-message">'+mChat+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+this.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+this.user.id+this.pivote+'" name="'+this.user.id+':'+this.user.name+' '+this.user.flastname+':'+mChat+'" class="btn-answer" title="Responder" onclick="answerToHelp(this)">⤵️</div></section>');
                }
                //this.modelChat.sendMessage(this.studentChat, message);
            }
            this.setImages(this.imgs, this.user.id+''+this.pivote);
            this.chat.push(messageData);
            this.pivote++;
            $('#list-unstyled').animate({ scrollTop: $('.p-2').height() }, 2500);
            document.getElementById('chat-message').value = "";
            this.rMessage = undefined;
            this.$(".r-message-content").hide('slow');
            if(message == undefined){
                this.sendMessage(messageData);
            }
        }else{
            if(message == undefined){
                document.getElementById('chat-message').setCustomValidity('Ingrese un mensaje');
            }else{
                var name = messageData.user.name + ' ' + messageData.user.flastname;
                this.$('.content-messages').append('<div id="'+messageData.user.id+this.pivote+'" class="message-interger"></div>');
                if(!message.message.rmessage){
                
                    this.$('#'+messageData.user.id+this.pivote+'').html('<section id="section-name-interger'+messageData.user.id+this.pivote+'" class="section-name-interger"><div class="chat-name-interger" id="chat-name-interger'+messageData.user.id+this.pivote+'"><strong>'+name+'</strong></div><div id="chat-message-interger'+messageData.user.id+this.pivote+'" class="chat-message-interger">'+messageData.message+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+messageData.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+messageData.user.id+this.pivote+'" name="'+messageData.user.id+':'+name+':'+messageData.message+'" class="btn-answer" title="Responder" onclick="answerToHelp(this)">⤵️</div></section>');
                }else{
                    if(message.message.rmessage.user_id == this.user.id){
                        name = 'Yo';
                    }
                    this.$('#'+messageData.user.id+this.pivote+'').html('<div class="message-reply"><section id="section-reply'+messageData.user.id+this.pivote+'" class="section-reply"><div id="chat-reply'+messageData.user.id+this.pivote+'" class="chat-i-name"><strong>'+name+'</strong></div><div id="chat-reply'+messageData.user.id+this.pivote+'" class="chat-i-message">'+messageData.rmessage.message+'</div></section></div><div class="message-answer"><section id="section-i'+messageData.user.id+this.pivote+'" class="section-i"><div id="chat-i-name'+messageData.user.id+this.pivote+'" class="chat-i-name"><strong>'+messageData.user.name +' '+messageData.user.flastname+'</strong></div><div id="chat-i-message'+messageData.user.id+this.pivote+'" class="chat-i-message">'+messageData.message+'</div><div class="r-message-content-photo" style="overflow-x: auto"><div id ="view-capture-chat-'+messageData.user.id+this.pivote+'" class="view-capture-chat" style="display: flex; background:none;"></div></div><div id="btn-answer'+messageData.user.id+this.pivote+'" name="'+messageData.user.id+':'+messageData.user.name +' '+messageData.user.flastname+':'+messageData.message+'" class="btn-answer" title="Responder" onclick="answerToHelp(this)">⤵️</div></section></div>');     
                
                    }
                this.chat.push(messageData);
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
    },
    sendMessage : function(message){
        var name = this.user.name+' '+this.user.flastname;
        console.log({name : name ,data : message});
        Echo.join('status.'+window.problemid)
        .whisper('messageHelpforTeacher',{name : name ,data : message})
    },
    
});