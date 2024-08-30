import { CollectionConfig } from 'payload/types'
import Roles from './Roles'

const Users: CollectionConfig = {
  slug: 'users',
  auth: true,
  admin: {
    useAsTitle: 'email',
  },
  fields: [
    {
      name: 'role',
      type: 'relationship',
      relationTo: Roles.slug,
    },
    {
      name: 'roleCode',
      type: 'text',
      admin: {
        hidden: true,
      },
    }
  ],
  hooks: {
    beforeChange: [
      async ({ data, req }) => {
        if (data.role) {
          const role = await req.payload.findByID({
            collection: 'roles',
            id: data.role,
          });
          data.roleCode = role.code; // Lưu mã code của role vào user
        }
        return data;
      },
    ],
  },
}

export default Users
