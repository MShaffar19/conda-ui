define [
    "jquery"
    "conda_ui/modal"
    "conda_ui/utils"
    "promise"
], ($, Modal, utils, Promise) ->

    class WindowsWarningView extends Modal.View
        initialize: (options) ->
            super(options)
            @promise = new Promise (fulfill, reject) =>
                @fulfill = fulfill
                @reject = reject

        title_text: () -> "Warning"

        render_body: () -> $("<p class=\"alert alert-warning\">Please close any Conda processes, such as IPython, before continuing. Else, the operation may fail.</p>")

        on_submit: (event) =>
            @hide()
            @fulfill()

        @warn_pscheck: () ->
            if utils.on_windows()
                view = new WindowsWarningView()
                view.show()
                return view.promise
            else
                return Promise.resolve(null)

    return { warn: WindowsWarningView.warn_pscheck }
