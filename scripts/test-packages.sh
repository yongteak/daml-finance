#!/bin/bash
# Copyright (c) 2022 Digital Asset (Switzerland) GmbH and/or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

set -eu

# Use absolute paths to allow this script to be called from any location
root_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")"; cd ..; pwd -P)

echo "Running package tests..."

# Run tests
# Util
daml test --project-root ${root_dir}/package/test/daml/Daml.Finance.Test.Util
## Date Utils
daml test --project-root ${root_dir}/package/test/daml/Daml.Finance.Util.Test
## Core
daml test --project-root ${root_dir}/package/test/daml/Daml.Finance.Holding.Test
daml test --project-root ${root_dir}/package/test/daml/Daml.Finance.Settlement.Test
daml test --project-root ${root_dir}/package/test/daml/Daml.Finance.RefData.Test
## Extensions
daml test --project-root ${root_dir}/package/test/daml/Daml.Finance.Instrument.Generic.Test
daml test --project-root ${root_dir}/package/test/daml/Daml.Finance.Instrument.Bond.Test
daml test --project-root ${root_dir}/package/test/daml/Daml.Finance.Instrument.Equity.Test

echo "\nAll tests ran successfully!"