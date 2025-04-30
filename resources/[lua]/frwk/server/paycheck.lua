ESX.StartPayCheck = function()
	function payCheck()
		local xPlayers = ESX.GetPlayers()

		for i = 1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

			if xPlayer then
				local society = exports['core']:getSociety(xPlayer.job.name)
				if society then
					if society.coffre['accounts'].society < xPlayer.job.grade_salary then
						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, '~g~Banque', '', 'Votre société n\'a plus d\'argent pour vous payer!', 9)
					else
						society.removeSocietyMoney(xPlayer.job.grade_salary)
						xPlayer.addAccountMoney('bank', xPlayer.job.grade_salary)

						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, '~g~Banque', _U('received_paycheck'), 'Vous avez reçu votre salaire: ^2$^0'..xPlayer.job.grade_salary, 9)
					end
				else
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, '~g~Banque', _U('received_paycheck'), _U('received_help', '^2$^0150'), 9)
				end
			end
		end

		SetTimeout(Config.PaycheckInterval, payCheck)
	end

	SetTimeout(Config.PaycheckInterval, payCheck)
end

CreateThread(function()
	ESX.StartPayCheck()
end)