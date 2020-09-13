class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            get_item = @@items.find {|item| item.name == item_name}
            if get_item == nil
                resp.write "Item not found"
                resp.status = 400
            else
                resp.write "The price of #{item_name} is #{get_item.price}"
                resp.write "You requested the songs"
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end

end