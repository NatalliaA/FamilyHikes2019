<%@ Page Title="Videos" Language="C#" MasterPageFile="~/Master/Hikes.Master" AutoEventWireup="true"
    CodeBehind="Videos.aspx.cs" Inherits="FamilyHikes2019.Videos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row text-center">
            <div class="col-lg-3 col-xl-3"></div>
            <div class="col-lg-6 col-xl-6">
            <h3>Video "Safety Tips - Hiking".</h3>
            <p>More videos coming soon!</p>
    
    <!--youtube player-->
    <!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
    
            <p id="player" class="rounded embed-responsive">
            </p>
        </div>
            <div class="col-lg-3 col-xl-3"></div>
        </div>
        </div>
            <script>
                $(function ()
                {
                    $(".state").selectmenu();

                });
            </script>
            <script type="text/javascript">
                // 2. This code loads the IFrame Player API Javascript code asynchronously.
                var tag = document.createElement('script');

                tag.src = "https://www.youtube.com/iframe_api"; // The link for the API request
                var firstScriptTag = document.getElementsByTagName('script')[0];
                firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                // 3. This function creates an <iframe> (and YouTube player) after the API code downloads.
                var player;
                function onYouTubeIframeAPIReady()
                {

                    player = new YT.Player('player', {
                        //height: '400',
                        //width: '500',
                        videoId: 'Bgu3db72lMw',
                        events: {
                            'onReady': onPlayerReady,
                            'onStateChange': onPlayerStateChange
                        }
                    });
                }

                // 4. The API will call this function when the video player is ready.
                function onPlayerReady(event)
                {
                    event.target.playVideo();
                }

                // 5. The API calls this function when the player's state changes.
                //    The function indicates that when playing a video (state=1),
                //    the player should play untill the .
                var done = false;
                function onPlayerStateChange(event)
                {
                    if (event.data == YT.PlayerState.ENDED)
                    { // If the event is that the video reached its end
                        player.seekTo(0, 1) // Go to the beginning of the video
                        player.pauseVideo() // Pause the video
                    }
                }
                function stopVideo()
                {
                    player.stopVideo();
                }
            </script>
    
    
</asp:Content>
