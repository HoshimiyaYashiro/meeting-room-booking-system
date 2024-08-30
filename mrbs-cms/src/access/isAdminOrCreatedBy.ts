import type { Access } from 'payload/config'
import type { FieldAccess } from 'payload/types'

import type { User } from '../payload-types'
import { checkRole } from '../utils/checkRole'

export const isAdminOrCreatedBy: Access = ({ req: { user } }) => {
  // Need to be logged in
  if (user) {
    // If user has role of 'admin'
    if (checkRole('admin', user)) {
      return true
    }

    // If any other type of user, only provide access to themselves
    return {
      created_by: {
        equals: user.id,
      },
    }
  }

  // Reject everyone else
  return false
}

export const isAdminOrCreatedByFieldLevel: FieldAccess<{ id: string }, unknown, User> = ({
  req: { user },
  id,
}) => {
  // Return true or false based on if the user has an admin role
  if (checkRole('admin', user)) return true
  if (user?.created_by === id) return true
  return false
}