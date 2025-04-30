
info_vessel <- gfwr::get_vessel_info(
    query = 431782000,
    search_type = "search",
    key = gfwr::gfw_auth())

print(info_vessel$selfReportedInfo$ssvid)
print(info_vessel$selfReportedInfo[, c("index", "vesselId")])

print("Arte de pesca")
print(info_vessel$registryInfo$geartypes)

mmsi_used <- info_vessel$selfReportedInfo[c("transmissionDateFrom", "transmissionDateTo", "ssvid", "index")] |> 
    dplyr::arrange(transmissionDateFrom, transmissionDateTo)

print(mmsi_used)