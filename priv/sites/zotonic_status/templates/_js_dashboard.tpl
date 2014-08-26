{% javascript %}
freeboard.initialize();

var config = {
    allow_edit: false,

    datasources: [ 
        {name: "stats", type: "JSON", settings: { url: "/api/zotonic_status/stats", refresh: 5 }},
        {name: "check", type:"JSON", settings: { url: "/api/zotonic_status/check", refresh: 5 }} 
    ],

    panes: [
        {title: "{_ Machine Load Average _}", 
         width: 1, row: {"3": 1}, col: {"3": 3}, 
         widgets: [
             {type: "text_widget",
              settings: {title: "1 min",
                         size: "regular", 
                         value: "load_avg(datasources[\"stats\"].os$cpu.avg1)",
                         sparkline: true,
                         animate: true
             }},
             {type: "text_widget",
              settings: {title: "5 mins",
                            size: "regular",
                            value: "load_avg(datasources[\"stats\"].os$cpu.avg5)",
                            sparkline: true,
                            animate: true}},
             {type: "text_widget",
              settings: {title: "15 mins",
                            size: "regular",
                            value: "load_avg(datasources[\"stats\"].os$cpu.avg15)",
                            sparkline: true,
                            animate: true}},
             {type: "text_widget",
              settings: {title:"# processes",
                            size: "regular", 
                            value: "datasources[\"stats\"].os$cpu.nprocs",
                            sparkline: true,
                            animate: true}}
             ]},

         {title: "{_ Erlang VM Stats _}",
          width:1,"row": {"3":1}, "col":{"3":2},
          widgets: [
             {type: "text_widget",
              settings: {title: "# processes",
                         size: "regular",
                         value: "datasources[\"stats\"].erlang$system_info.process_count",
                         sparkline: true,
                         animate: true}},
             {type: "text_widget",
              settings:{title: "Run queue length",
                        size: "regular",
                        value: "datasources[\"stats\"].erlang$statistics.run_queue", 
                        sparkline: true,
                        animate: true}}
         ]},

         {title: "{_ Erlang Memory _}", width:1, "row": {"3":0},"col":{"3":2}, 
          widgets: [
             {type: "text_widget",
              settings: {title: "Total",
                         size:"regular",
                         value: "Mb(datasources[\"stats\"].erlang$memory.total)",
                         sparkline: true,
                         animate: true,
                         units: "Mb"}},
             {type: "text_widget",
              settings: {title: "Processes",
                         size: "regular",
                         value: "Mb(datasources[\"stats\"].erlang$memory.processes)",
                         sparkline: true,
                         animate: true,
                         units: "Mb"}},
             {type: "text_widget",
              settings: {title: "Ets", 
                         size: "regular",
                         value: "Mb(datasources[\"stats\"].erlang$memory.ets)",
                         sparkline: true,
                         animate: true,
                         units: "Mb"}},
             {type: "text_widget",
              settings: {title: "Binary",
                         size: "regular",
                         value: "Mb(datasources[\"stats\"].erlang$memory.binary)",
                         sparkline: true,
                         animate: true,
                         units: "Mb"}},
             {type: "text_widget",
              settings: {title: "Atom",
                         size: "regular",
                         value: "Mb(datasources[\"stats\"].erlang$memory.atom)",
                         sparkline: true,
                         animate: true,
                         units: "Mb"}},
             {type: "text_widget",
              settings: {title: "Code",
                         size: "regular",
                         value: "Mb(datasources[\"stats\"].erlang$memory.code)",
                         sparkline: true,
                         animate: true,
                         units: "Mb"}}
         ]},

         {title: "{_ Erlang I/O _}",
          width:1, row: {"3": 0}, col: {"3": 3},"widgets": [
             {type: "text_widget",
              settings: {title: "Input",
                         size: "regular",
                         value: "Gb(datasources[\"stats\"].erlang$io.input)",
                         animate: true,
                         units: "Gb"}},
             {type: "text_widget",
              settings: {title: "Output",
                         size: "regular",
                         value: "Gb(datasources[\"stats\"].erlang$io.output)",
                         animate: true,
                         units: " Gb"}}
        ]},

        {title: "Zotonic", "width": 1, "row": {"3": 1}, "col":{"3": 1},
         widgets: [
             {type: "indicator",
              settings: {title: "State",
                         value: "datasources[\"check\"].status",
                         on_text: "All sites running",
                         off_text:"There is a problem"}}
        ]},

        {% for site_name in sites %}
             {title: "{{ site_name }}",
              width: 1, row: {"3": 0}, col: {"3": 1}, 
              widgets: [
                {type: "text_widget",
                 settings: {title: "# sessions",
                            size: "regular", 
                            value: "datasources[\"stats\"].zotonic${{ site_name }}$session$sessions.value",
                            sparkline: true,
                            animate: true}},
                {type: "text_widget",
                 settings: {title: "# page processes",
                            size: "regular", 
                            value: "datasources[\"stats\"].zotonic${{ site_name }}$session$page_processes.value",
                            sparkline: true,
                            animate: true}},
             ]},
        {% endfor %}

        ]
     }

     freeboard.loadDashboard(config);
{% endjavascript %}
