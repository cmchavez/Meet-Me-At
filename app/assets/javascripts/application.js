// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery2
//= require jquery_ujs
//= require bootstrap-sprockets
//= require users
//= require chat
//= require turbolinks
//= require_tree .
//= require private_pub

var ready = function () {
 
    /**
     * When the send message link on our home page is clicked
     * send an ajax request to our rails app with the sender_id and
     * recipient_id
     */
 
    $('.start-conversation').click(function (e) {
        e.preventDefault();
 
        var sender_id = $(this).data('sid');
        var recipient_id = $(this).data('rip');
 
        $.post("/invites", { sender_id: sender_id, recipient_id: recipient_id }, function (data) {
            chatBox.chatWith(data.invite_id);
        });
    });
 
    /**
     * Used to minimize the chatbox
     */
 
    $(document).on('click', '.toggleChatBox', function (e) {
        e.preventDefault();
 
        var id = $(this).data('cid');
        chatBox.toggleChatBoxGrowth(id);
    });
 
    /**
     * Used to close the chatbox
     */
 
    $(document).on('click', '.closeChat', function (e) {
        e.preventDefault();
 
        var id = $(this).data('cid');
        chatBox.close(id);
    });
 
 
    /**
     * Listen on keypress' in our chat textarea and call the
     * chatInputKey in chat.js for inspection
     */
 
    $(document).on('keydown', '.chatboxtextarea', function (event) {
 
        var id = $(this).data('cid');
        chatBox.checkInputKey(event, $(this), id);
    });
 
    /**
     * When a conversation link is clicked show up the respective
     * conversation chatbox
     */
 
    $('a.conversation').click(function (e) {
        e.preventDefault();
 
        var invite_id = $(this).data('cid');
        chatBox.chatWith(invite_id);
    });
 
 
}
 
$(document).ready(ready);
$(document).on("page:load", ready);









