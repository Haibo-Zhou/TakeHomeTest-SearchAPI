# TakeHomeTest-SearchAPI

This project is a takeHome test of iOS App I received recently, which is written on Swift.



#### Requirements: Host a local in-app http server with a search API
- Return some dummy data when requesting the search API.
- Must use SwiftUI for UI design.
  
#### What this app is made of:
- Used [GCDWebServer](https://github.com/swisspol/GCDWebServer) as in-app http server(back end).
- User interface is created in `SwiftUI`.
- Used `Combine` to deal with the networking part.
- Used MVVM as design pattern.
- Supported on Dark Mode.

#### Besides that:
- Add a handler in GCDWebServer to handle incoming http request.And check on the `query` and `page` in the request URL.
I put some mocking json data files as the response json object. 

- It contains some `deprecated files` because I create it with UIKit in the beginning, but I suddenly get a call after 2 days from the agent who said they WANT SwiftUI. Thus change the UI part to SwiftUI then.

- `Not complete`: Paginated logic. After I use two ForEach loop to populate product's section header and product items.
The paginated logic is not worked anymore, my original idea is to create an var as index to store the total times of iteration of for loop. 
However, SwiftUI doesn't allow control flow statement in body view. I will figure it out later.



