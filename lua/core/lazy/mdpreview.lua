return {
    "Rainswolves/mdpreview",

    config = function()
        require("mdpreview").setup({
            on_event = "TextChangedI",  -- reload trigger event
            scrolling = true,  -- off by default
	})
    end
}
