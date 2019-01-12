defmodule Bamboo.ClicksendAdapter do

  @behaviour Bamboo.Adapter

  @required_configuration ~w(
    api_key
    from_email_id
    username
  )a

  def deliver(email, config) do
    %{subject: subject,
      text_body: body,
      from: {from_name, _from_email},
      to: tos} = Bamboo.Mailer.normalize_addresses(email)

    credentials   = Map.take(config, ~w(api_key username)a)
    from_email_id = config[:from_email_id]

		ClickSend.EmailMessage.new(
      tos,
			from_email_id,
      from_name,
			subject,
      body
		)
		|> ClickSend.Email.send(credentials: credentials)
	end

	@doc false
	def handle_config(config) do
		config
    |> check_required_configuration()
	end

  # Private ###########

  defp check_required_configuration(config) do
    @required_configuration
    |> Enum.reduce([], &aggregate_errors(config, &1, &2))
    |> raise_on_missing_configuration(config)
  end

  defp aggregate_errors(config, key, errors) do
    config
    |> Map.fetch(key)
    |> build_error(key, errors)
  end

  defp build_error({:ok, value}, _key, errors) when value != nil, do: errors
  defp build_error(_not_found_value, key, errors) do
    ["Key #{key} is required" | errors]
  end

  defp raise_on_missing_configuration([],     config), do: config
  defp raise_on_missing_configuration(errors, config) do
    formatted_errors =
      errors
      |> Enum.map(&("* #{&1}"))
      |> Enum.join("\n")

    raise ArgumentError, """
    The following configurations were not provided:
    #{formatted_errors}
    Without these configurations the ClickSend adapter will not work. Provided configuration:
    #{inspect(config)}
    """
  end

end
