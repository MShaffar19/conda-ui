define [
    "jquery"
], ($) ->

    api = (url, data, success, failure) ->
        $.ajax({
            url: "/api/" + url,
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(data),
            success: success,
            failure: failure,
        })