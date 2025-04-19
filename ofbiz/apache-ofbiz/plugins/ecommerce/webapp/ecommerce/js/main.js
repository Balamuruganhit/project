

const apiKey = 'AIzaSyCrJYoXFPxCC4O14XYsHVAuAyLZ0JI1QhY'; // Replace this with your actual API key
    const query = 'poultry farming news in tamil';
    const maxResults = 50;

    async function loadVideos() {
      try {
        const response = await fetch(`https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=${maxResults}&q=${encodeURIComponent(query)}&key=${apiKey}&type=video`);
        const data = await response.json();
        const container = document.getElementById('youtube-videos');
        container.innerHTML = ''; // Clear "Loading..."

        data.items.forEach(item => {
          const videoId = item.id.videoId;
          const iframe = document.createElement('iframe');
          iframe.src = `https://www.youtube.com/embed/${videoId}`;
          iframe.allow = 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share';
          iframe.allowFullscreen = true;
          container.appendChild(iframe);
        });
      } catch (error) {
        document.getElementById('youtube-videos').innerHTML = 'Failed to load videos.';
        console.error('Error fetching videos:', error);
      }
    }

loadVideos();
