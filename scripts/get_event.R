info_vessel <- gfwr::gfw_vessel_info(
    query = 431782000,
    search_type = "search",
    key = gfwr::gfw_auth())

id_test <- info_vessel$selfReportedInfo$vesselId[4]

visitas_puerto <- gfwr::gfw_event(
    event_type = "PORT_VISIT",
    vessels = id_test,
    start_date = "2017-01-26",
    end_date = "2022-12-31",
    key = gfwr::gfw_auth()
)

unnested_visitas_puerto <- visitas_puerto |> 
    tidyr::unnest_wider(event_info)

print(unnested_visitas_puerto)

visitas_puerto <- gfwr::gfw_event(
    event_type = "PORT_VISIT",
    vessels = id_test,
    start_date = "2017-01-26",
    end_date = "2022-12-31",
    confidence = c(4),
    key = gfwr::gfw_auth()
)