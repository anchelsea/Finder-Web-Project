import axios from "axios";

$('.ui.modal.signin')
    .modal('attach events', '.test.button', 'show')
;

$('.ui.modal.signup')
    .modal('attach events', '.test1.button', 'show')
;

/*
function signup(id, url) {
    axios.get('signup?id='+id, function(data) {
        if(data == 'OK') {
            window.open(url);
        }
    }, 'text');
}*/
